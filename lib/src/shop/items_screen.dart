import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../shop/shop_item.dart';
import '../status/click_counter.dart';
import '../Transition/transition.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    final MochiClicker mochiCount = context.watch<MochiClicker>();
    final ShopItems shopItems = context.watch<ShopItems>();
    List<String> imagesLink = [
      'assets/images/無料の手のひらアイコン.png',
      'assets/images/バーベキューの無料アイコン2.png',
      'assets/images/ショップアイコン5.png',
      'assets/images/工場の無料アイコン.png',
      'assets/images/仙人アイコン1.png',
      'assets/images/チチェン・イッツァ3.png',
      'assets/images/蝶のアイコン素材4.png',
      'assets/images/木アイコン.png',
      'assets/images/山のシルエット.png',
      'assets/images/オーストラリアのアイコン.png',
      'assets/images/波のアイコン2.png',
      'assets/images/土星、木星のアイコン.png',
      'assets/images/科学アイコン.png',
      'assets/images/ギャラクシーアイコン.png',
      'assets/images/無料で使えるピザのアイコン.png',
      'assets/images/ペンキ跡アイコン1.png',
      'assets/images/神戸タワーのフリーアイコン.png',
      'assets/images/神社のシンボル鳥居のアイコン.png',
    ];

    return ListView.builder(
      key: const PageStorageKey<String>('one'),
      itemCount: 18,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                  height: context.height * 0.08,
                  width: context.width * 0.2,
                  child: Image.asset(imagesLink[index]),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: context.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '${shopItems.itemData[index].itemCount} ${shopItems.itemData[index].itemName}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Corporate Logo Medium',
                          ),
                        ),
                      ),
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.fitWidth,
                        child: Text(
                          shopItems.itemData[index].itemInfo,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Corporate Logo Medium',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: context.width * 0.13,
                  child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                    ),
                    onPressed: () {
                      // 餅の所持数がアイテム価格以上の場合 & MpSが動いてない場合
                      if (mochiCount.clickData.count >=
                              shopItems.itemData[index].itemPrice &&
                          mochiCount.clickData.mpsFlag == 0) {
                        // 現在の餅所持数からアイテムの価格を引く
                        mochiCount.clickData.count -=
                            shopItems.itemData[index].itemPrice;
                        // アイテムの更新・通知
                        shopItems.incrementItems(index);
                        // MpS値の更新
                        mochiCount.clickData.mps +=
                            shopItems.itemData[index].mpsRate;
                        // MpSの加算を開始する
                        Timer.periodic(Duration(seconds: 1), (Timer timer) {
                          mochiCount.clickData.count +=
                              mochiCount.clickData.mps;
                          mochiCount.clickData.totalCount +=
                              mochiCount.clickData.mps;
                          mochiCount.onlyNotify();
                        });
                        // MpS始動フラグをオンにする
                        mochiCount.clickData.mpsFlag = 1;
                        // 更新を通知
                        mochiCount.onlyNotify();
                        // 餅の所持数がアイテム価格以上の場合 & MpSが動いている場合
                      } else if (mochiCount.clickData.count >=
                              shopItems.itemData[index].itemPrice &&
                          mochiCount.clickData.mpsFlag == 1) {
                        // 現在の餅所持数からアイテムの価格を引く
                        mochiCount.clickData.count -=
                            shopItems.itemData[index].itemPrice;
                        // アイテムの更新・通知
                        shopItems.incrementItems(index);
                        // MpS値の更新
                        mochiCount.clickData.mps +=
                            shopItems.itemData[index].mpsRate;
                        // 更新を通知
                        mochiCount.onlyNotify();
                        // 餅の所持数が足りない場合、画面に通知を表示
                      } else {
                        showDialog<void>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color.fromARGB(255, 42, 157, 143),
                              content: Text(
                                'お餅が足りません！',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Back',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 196, 106),
                                      fontSize: 16,
                                      fontFamily: 'Corporate Logo Medium',
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: SizedBox(
                      width: context.width * 0.08,
                      child: Column(
                        children: [
                          Image.asset('assets/images/プラスのアイコン素材.png'),
                          Text(
                            customCompactFormatNoflout(shopItems.itemData[index].itemPrice, 0),
                            style: TextStyle(
                              color: Color.fromARGB(255, 38, 70, 83),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Corporate Logo Medium',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: context.width * 0.13,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                    ),
                    onPressed: () async {
                      if (shopItems.itemData[index].itemCount == 0) {
                        await showDialog<void>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Color.fromARGB(255, 42, 157, 143),
                              content: Text(
                                'アイテムを所有していません！',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Back',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 233, 196, 106),
                                      fontSize: 16,
                                      fontFamily: 'Corporate Logo Medium',
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        await shopItems.decrementItems(index);
                        mochiCount.clickData.count +=
                            shopItems.itemData[index].itemPrice;
                        mochiCount.clickData.mps -=
                            shopItems.itemData[index].mpsRate;
                        mochiCount.onlyNotify();
                      }
                    },
                    child: SizedBox(
                      width: context.width * 0.08,
                      child: Column(
                        children: [
                          Image.asset('assets/images/マイナスのアイコン素材.png'),
                          Text(
                            (shopItems.itemData[index].itemCount != 0)
                                ? customCompactFormatNoflout(
                                    shopItems.itemData[index].itemPrice / 3, 0)
                                : '0',
                            style: TextStyle(
                              color: Color.fromARGB(255, 38, 70, 83),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Corporate Logo Medium',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 2.0,
              indent: 16.0,
              endIndent: 16.0,
            ),
          ],
        );
      },
    );
  }
}
