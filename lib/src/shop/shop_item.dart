import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shop_item.g.dart';

// データモデルの定義
@Collection()
class ItemModel {
  Id id = Isar.autoIncrement;
  late String itemName;
  late String itemInfo;
  late double itemPrice;
  late double itemPriceRate;
  late double mpsRate;
  late int itemCount;
}

// 状態管理
class ShopItems extends ChangeNotifier {
  // シングルトンによるインスタンスの単一化
  static final ShopItems _instance = ShopItems._internal();
  factory ShopItems() => _instance;
  ShopItems._internal();

  // Isarのデータを格納するリスト
  List<ItemModel> _itemData = [];
  List<ItemModel> get itemData => _itemData;
  List<int> ids = List.generate(19, (index) => index + 1);
  late Isar _isar;

  // 初期化
  Future<void> initIsar() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTimeItem = prefs.getBool('isFirstTimeItem') ?? true;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ItemModelSchema],
      name: 'ItemModelDB',
      inspector: true,
      directory: dir.path,
    );

    // 初回起動時の動作
    if (isFirstTimeItem) {
      await onlyOnce();
      await prefs.setBool('isFirstTime', false);
    }

    // DBからデータ取得
    _itemData = (await _isar.itemModels.getAll(ids))
        .where((item) => item != null)
        .map((item) => item!)
        .toList();
    notifyListeners();
  }

  Future<void> onlyOnce() async {
    var item1 = ItemModel()
      ..itemName = 'handmade'
      ..itemInfo = '手作りの美味しい餅です。'
      ..itemPrice = 10
      ..itemPriceRate = 3
      ..mpsRate = 0.1
      ..itemCount = 0;

    var item2 = ItemModel()
      ..itemName = 'mochiMachine'
      ..itemInfo = '家庭用餅つき機で作った餅です。'
      ..itemPrice = 100
      ..itemPriceRate = 3
      ..mpsRate = 1
      ..itemCount = 0;

    var item3 = ItemModel()
      ..itemName = 'mochiya'
      ..itemInfo = 'お餅屋さんの美味しい餅です。'
      ..itemPrice = 1000
      ..itemPriceRate = 3
      ..mpsRate = 10
      ..itemCount = 0;

    var item4 = ItemModel()
      ..itemName = 'mochiFactory'
      ..itemInfo = '餅工場で大量生産された餅です。'
      ..itemPrice = 10000
      ..itemPriceRate = 3
      ..mpsRate = 100
      ..itemCount = 0;

    var item5 = ItemModel()
      ..itemName = 'mochiMaster'
      ..itemInfo = '餅名人による至高の餅です。'
      ..itemPrice = 100000
      ..itemPriceRate = 3
      ..mpsRate = 1000
      ..itemCount = 0;

    var item6 = ItemModel()
      ..itemName = 'mochiRuin'
      ..itemInfo = '餅遺跡から発見された古代の餅です。'
      ..itemPrice = 1000000
      ..itemPriceRate = 3
      ..mpsRate = 10000
      ..itemCount = 0;

    var item7 = ItemModel()
      ..itemName = 'mochiFairy'
      ..itemInfo = '餅妖精が生み出した不思議な餅です。'
      ..itemPrice = 10000000
      ..itemPriceRate = 3
      ..mpsRate = 100000
      ..itemCount = 0;

    var item8 = ItemModel()
      ..itemName = 'mochiTree'
      ..itemInfo = '餅の木から生まれた天然餅です。'
      ..itemPrice = 100000000
      ..itemPriceRate = 3
      ..mpsRate = 1000000
      ..itemCount = 0;

    var item9 = ItemModel()
      ..itemName = 'mochiVolcano'
      ..itemInfo = '餅火山の噴火により放出された餅です。'
      ..itemPrice = 1000000000
      ..itemPriceRate = 3
      ..mpsRate = 10000000
      ..itemCount = 0;

    var item10 = ItemModel()
      ..itemName = 'mochiContinent'
      ..itemInfo = '天地創造によりできた餅大陸です。'
      ..itemPrice = 10000000000
      ..itemPriceRate = 3
      ..mpsRate = 100000000
      ..itemCount = 0;

    var item11 = ItemModel()
      ..itemName = 'mochiOcean'
      ..itemInfo = '天地創造によりできた餅の海です。'
      ..itemPrice = 100000000000
      ..itemPriceRate = 3
      ..mpsRate = 1000000000
      ..itemCount = 0;

    var item12 = ItemModel()
      ..itemName = 'mochiPlanet'
      ..itemInfo = '餅の惑星です。構成物質は餅です。勿論。'
      ..itemPrice = 1000000000000
      ..itemPriceRate = 3
      ..mpsRate = 10000000000
      ..itemCount = 0;

    var item13 = ItemModel()
      ..itemName = 'mochiGalaxy'
      ..itemInfo = '餅の銀河です。とてつもないですね。'
      ..itemPrice = 10000000000000
      ..itemPriceRate = 3
      ..mpsRate = 100000000000
      ..itemCount = 0;

    var item14 = ItemModel()
      ..itemName = 'mochiCluster'
      ..itemInfo = '餅の銀河団です。でっけぇ～！！！'
      ..itemPrice = 100000000000000
      ..itemPriceRate = 3
      ..mpsRate = 1000000000000
      ..itemCount = 0;

    var item15 = ItemModel()
      ..itemName = 'mochiSuperCluster'
      ..itemInfo = '餅の超銀河団です。デカ過ぎんだろ…'
      ..itemPrice = 1000000000000000
      ..itemPriceRate = 3
      ..mpsRate = 10000000000000
      ..itemCount = 0;

    var item16 = ItemModel()
      ..itemName = 'mochiGreatWall'
      ..itemInfo = '餅のGWです。超餅を超えた餅ってとこかな'
      ..itemPrice = 10000000000000000
      ..itemPriceRate = 3
      ..mpsRate = 100000000000000
      ..itemCount = 0;

    var item17 = ItemModel()
      ..itemName = 'mochiDimension'
      ..itemInfo = '餅次元です。もう訳が分かりません。'
      ..itemPrice = 100000000000000000
      ..itemPriceRate = 3
      ..mpsRate = 1000000000000000
      ..itemCount = 0;

    var item18 = ItemModel()
      ..itemName = 'mochiGod'
      ..itemInfo = '餅の神です。逆らえば餅にされます。怖い。'
      ..itemPrice = 1000000000000000000
      ..itemPriceRate = 3
      ..mpsRate = 10000000000000000
      ..itemCount = 0;

    await _isar.writeTxn(() async {
      await _isar.itemModels.put(item1);
      await _isar.itemModels.put(item2);
      await _isar.itemModels.put(item3);
      await _isar.itemModels.put(item4);
      await _isar.itemModels.put(item5);
      await _isar.itemModels.put(item6);
      await _isar.itemModels.put(item7);
      await _isar.itemModels.put(item8);
      await _isar.itemModels.put(item9);
      await _isar.itemModels.put(item10);
      await _isar.itemModels.put(item11);
      await _isar.itemModels.put(item12);
      await _isar.itemModels.put(item13);
      await _isar.itemModels.put(item14);
      await _isar.itemModels.put(item15);
      await _isar.itemModels.put(item16);
      await _isar.itemModels.put(item17);
      await _isar.itemModels.put(item18);
    });
  }

  // アイテムの加算更新
  Future<void> incrementItems(int index) async {
    await _isar.writeTxn(() async {
      final item = itemData[index];
      item.itemPrice = item.itemPrice * item.itemPriceRate;
      item.itemCount++;
      await _isar.itemModels.put(item);
    });
    notifyListeners();
  }

  // アイテムの減算更新
  Future<void> decrementItems(int index) async {
    await _isar.writeTxn(() async {
      final item = itemData[index];
      item.itemPrice = item.itemPrice / item.itemPriceRate;
      item.itemCount--;
      await _isar.itemModels.put(item);
    });
    notifyListeners();
  }

  Future<void> resetItems() async{
    for(int i = 0;i < 18;i++){
      final item = _itemData[i];
      item.itemPrice = (10 * pow(10, i).toDouble());
      item.mpsRate = (0.1 * pow(10, i).toDouble());
      item.itemCount = 0;
    }
    await _isar.writeTxn(() async {
      await _isar.itemModels.putAll(_itemData);
    });
    notifyListeners();
  }

  int getItemCountTotal() {
    int count = 0;
    for (final item in _itemData) {
      count += item.itemCount;
    }
    return count;
  }

  Future<void> saveItems() async {
    await _isar.writeTxn(() async {
      await _isar.itemModels.putAll(_itemData);
    });
  }
}
