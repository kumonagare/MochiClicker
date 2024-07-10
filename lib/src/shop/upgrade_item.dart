import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'upgrade_item.g.dart';

@Collection()
class UpgradeModel {
  Id id = Isar.autoIncrement;
  late String upgradeItemName;
  late String upgradeItemInfo;
  late double upgradePrice;
  late double upgradePriceRate;
  late int listCount;
  late double effectRate;
  late int upgradeFlag;
}

class UpgradeItems extends ChangeNotifier {
  // シングルトンによるインスタンスの単一化
  static final UpgradeItems _instance = UpgradeItems._internal();
  factory UpgradeItems() => _instance;
  UpgradeItems._internal();

  // Isarのデータを格納するリスト
  List<UpgradeModel> _upgradeData = [];
  List<UpgradeModel> get upgradeData => _upgradeData;
  List<int> ids = List.generate(19, (index) => index + 1);
  late Isar _isar;

  // 初期化
  Future<void> initIsar() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTimeUpgrade = prefs.getBool('isFirstTimeUpgrade') ?? true;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UpgradeModelSchema],
      name: 'UpgradeModelDB',
      inspector: true,
      directory: dir.path,
    );

    // 初回起動時の動作
    if (isFirstTimeUpgrade) {
      await onlyOnce();
      await prefs.setBool('isFirstTimeUpgrade', false);
    }

    // DBからデータ取得
    _upgradeData = (await _isar.upgradeModels.getAll(ids))
        .where((item) => item != null)
        .map((item) => item!)
        .toList();
    notifyListeners();
  }

  Future<void> onlyOnce() async {
    var item1 = UpgradeModel()
      ..upgradeItemName = 'Clicker'
      ..upgradeItemInfo = 'MpSの1%が1クリックに加算されます。'
      ..upgradePrice = 50000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item2 = UpgradeModel()
      ..upgradeItemName = 'Handmade'
      ..upgradeItemInfo = '手作りの効果が2倍になります。'
      ..upgradePrice = 100
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item3 = UpgradeModel()
      ..upgradeItemName = 'mochiMachine'
      ..upgradeItemInfo = '餅つき機の効果が2倍になります。'
      ..upgradePrice = 1000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item4 = UpgradeModel()
      ..upgradeItemName = 'mochiya'
      ..upgradeItemInfo = '餅屋の効果が2倍になります。'
      ..upgradePrice = 10000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item5 = UpgradeModel()
      ..upgradeItemName = 'mochiFactory'
      ..upgradeItemInfo = '工場の効果が2倍になります。'
      ..upgradePrice = 100000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item6 = UpgradeModel()
      ..upgradeItemName = 'mochiMaster'
      ..upgradeItemInfo = '名人の効果が2倍になります。'
      ..upgradePrice = 1000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item7 = UpgradeModel()
      ..upgradeItemName = 'mochiRuin'
      ..upgradeItemInfo = '遺跡の効果が2倍になります。'
      ..upgradePrice = 10000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item8 = UpgradeModel()
      ..upgradeItemName = 'mochiFairy'
      ..upgradeItemInfo = '妖精の効果が2倍になります。'
      ..upgradePrice = 100000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item9 = UpgradeModel()
      ..upgradeItemName = 'mochiTree'
      ..upgradeItemInfo = '木の効果が2倍になります。'
      ..upgradePrice = 1000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item10 = UpgradeModel()
      ..upgradeItemName = 'mochiVolcano'
      ..upgradeItemInfo = '火山の効果が2倍になります。'
      ..upgradePrice = 10000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item11 = UpgradeModel()
      ..upgradeItemName = 'mochiContinent'
      ..upgradeItemInfo = '大陸の効果が2倍になります。'
      ..upgradePrice = 100000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item12 = UpgradeModel()
      ..upgradeItemName = 'mochiOcean'
      ..upgradeItemInfo = '海の効果が2倍になります。'
      ..upgradePrice = 1000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item13 = UpgradeModel()
      ..upgradeItemName = 'mochiPlanet'
      ..upgradeItemInfo = '惑星の効果が2倍になります。'
      ..upgradePrice = 10000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item14 = UpgradeModel()
      ..upgradeItemName = 'mochiGalaxy'
      ..upgradeItemInfo = '銀河の効果が2倍になります。'
      ..upgradePrice = 100000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item15 = UpgradeModel()
      ..upgradeItemName = 'mochiCluster'
      ..upgradeItemInfo = '銀河団の効果が2倍になります。'
      ..upgradePrice = 1000000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item16 = UpgradeModel()
      ..upgradeItemName = 'mochiSuperCluster'
      ..upgradeItemInfo = '超銀河団の効果が2倍になります。'
      ..upgradePrice = 10000000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item17 = UpgradeModel()
      ..upgradeItemName = 'mochiGreatWall'
      ..upgradeItemInfo = 'GWの効果が2倍になります。'
      ..upgradePrice = 100000000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item18 = UpgradeModel()
      ..upgradeItemName = 'mochiDimension'
      ..upgradeItemInfo = '次元の効果が2倍になります。'
      ..upgradePrice = 1000000000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    var item19 = UpgradeModel()
      ..upgradeItemName = 'mochiGod'
      ..upgradeItemInfo = '神の効果が2倍になります。'
      ..upgradePrice = 10000000000000000000
      ..upgradePriceRate = 2
      ..listCount = 0
      ..effectRate = 0
      ..upgradeFlag = 0;

    await _isar.writeTxn(() async {
      await _isar.upgradeModels.put(item1);
      await _isar.upgradeModels.put(item2);
      await _isar.upgradeModels.put(item3);
      await _isar.upgradeModels.put(item4);
      await _isar.upgradeModels.put(item5);
      await _isar.upgradeModels.put(item6);
      await _isar.upgradeModels.put(item7);
      await _isar.upgradeModels.put(item8);
      await _isar.upgradeModels.put(item9);
      await _isar.upgradeModels.put(item10);
      await _isar.upgradeModels.put(item11);
      await _isar.upgradeModels.put(item12);
      await _isar.upgradeModels.put(item13);
      await _isar.upgradeModels.put(item14);
      await _isar.upgradeModels.put(item15);
      await _isar.upgradeModels.put(item16);
      await _isar.upgradeModels.put(item17);
      await _isar.upgradeModels.put(item18);
      await _isar.upgradeModels.put(item19);
    });
  }

  Future<void> incrementUpgradeItems(int index) async {
    await _isar.writeTxn(() async {
      final item = _upgradeData[index];
      if (index == 0) {
        item.upgradePrice = item.upgradePrice * 10;
        item.effectRate += 0.01;
        item.listCount++;
      } else {
        item.upgradePrice = item.upgradePrice * item.upgradePriceRate;
        item.listCount++;
      }
      await _isar.upgradeModels.put(item);
    });
    notifyListeners();
  }

  Future<void> resetUpgradeItems() async {
    for (int i = 0; i < 19; i++) {
      final item = _upgradeData[i];
      if (i == 0) {
        item.upgradePrice = 50000;
        item.effectRate = 0;
        item.listCount = 0;
        item.upgradeFlag = 0;
      } else {
        item.upgradePrice = (10 * pow(10, i).toDouble());
        item.listCount = 0;
      }
      await _isar.writeTxn(() async {
        await _isar.upgradeModels.putAll(_upgradeData);
      });
    }
    notifyListeners();
  }

  Future<void> saveUpgrades() async {
    await _isar.writeTxn(() async {
      await _isar.upgradeModels.putAll(_upgradeData);
    });
  }
}
