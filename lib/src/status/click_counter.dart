import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

import '../Transition/transition.dart';

part 'click_counter.g.dart';

// 状態クラス
@Collection()
class ClickModel {
  Id id = Isar.autoIncrement;
  late double count;
  late double totalCount;
  late double mps;
  late int mpsFlag;
}

// 状態管理クラス
class MochiClicker extends ChangeNotifier {
  // シングルトンによるインスタンスの単一化
  static final MochiClicker _instance = MochiClicker._internal();
  factory MochiClicker() => _instance;
  MochiClicker._internal();

  // Isarのデータを格納するリスト
  ClickModel _clickData = ClickModel();
  ClickModel get clickData => _clickData;
  late Isar _isar;

  // 初期化
  Future<void> initIsar() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTimeClick = prefs.getBool('isFirstTimeClick') ?? true;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ClickModelSchema],
      name: 'ClickModelDB',
      inspector: true,
      directory: dir.path,
    );

    // 初回起動時の動作
    if (isFirstTimeClick) {
      await onlyOnce();
      await prefs.setBool('isFirstTimeClick', false);
    } else {
      Timer.periodic(Duration(seconds: 1), (Timer timer) {
        _clickData.count += _clickData.mps;
        _clickData.totalCount += _clickData.mps;
        onlyNotify();
      });
    }

    _clickData = await _isar.clickModels.get(1) ?? ClickModel();

    notifyListeners();
  }

  Future<void> onlyOnce() async {
    var item1 = ClickModel()
      ..count = 0
      ..totalCount = 0
      ..mps = 0
      ..mpsFlag = 0;

    await _isar.writeTxn(() async {
      await _isar.clickModels.put(item1);
    });
  }

  Future<void> incrementCounter() async {
    await _isar.writeTxn(() async {
      _clickData.count++;
      _clickData.totalCount++;
      await _isar.clickModels.put(_clickData);
    });
    notifyListeners();
  }

  Future<void> resetCounter() async {
    _clickData.count = 0;
    _clickData.totalCount = 0;
    _clickData.mps = 0;
    await _isar.writeTxn(() async {
      await _isar.clickModels.put(_clickData);
    });
    notifyListeners();
  }

  Future<void> saveClicker() async {
    await _isar.writeTxn(() async {
      await _isar.clickModels.put(_clickData);
    });
  }

  void onlyNotify() {
    notifyListeners();
  }
}

// 画面上部、現在の餅の保持数&秒間の餅生産数
class ClickCounter extends StatelessWidget {
  const ClickCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MochiClicker mochiCount = context.watch<MochiClicker>();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.fitWidth,
              child: Text(
                '${customCompactFormat(mochiCount.clickData.count, 1)} Mochi',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Corporate Logo Medium',
                ),
              ),
            ),
          ),
          Container(
            child: FittedBox(
              alignment: Alignment.centerLeft,
              fit: BoxFit.fitWidth,
              child: Text(
                '${customCompactFormat(mochiCount.clickData.mps, 1)}/s',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Corporate Logo Medium',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
