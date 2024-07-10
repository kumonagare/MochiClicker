import 'package:flutter/material.dart';
import 'package:mochi_clicker/src/shop/shop_item.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../shop/upgrade_item.dart';
import '../status/click_counter.dart';
import '../achievement/achievement_data.dart';
import '../Transition/transition.dart';

class UpgradeScreen extends StatelessWidget {
  const UpgradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MochiClicker mochiCount = context.watch<MochiClicker>();
    final ShopItems shopItems = context.watch<ShopItems>();
    final UpgradeItems upgradeItems = context.watch<UpgradeItems>();
    final AchievementData achievementData = context.watch<AchievementData>();

    final title = <String>[
      'Iron',
      'Bronze',
      'Silver',
      'Gold',
      'Platinum',
      'Diamond',
      'Master',
      'Devil',
      'Angel',
      'God',
    ];

    List<Color> imageColors = [
      Color.fromARGB(255, 184, 174, 174),
      Color.fromARGB(255, 243, 148, 53),
      Color.fromARGB(255, 192, 192, 192),
      Color.fromARGB(255, 211, 181, 114),
      Color.fromARGB(255, 104, 238, 216),
      Color.fromARGB(255, 233, 237, 242),
      Color.fromARGB(255, 214, 45, 236),
      Color.fromARGB(255, 111, 0, 126),
      Color.fromARGB(255, 248, 248, 248),
      Color.fromARGB(255, 251, 255, 39),
    ];

    List<String> imagesLink = [
      'assets/images/タッチアイコン.png',
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
      key: const PageStorageKey<String>('two'),
      itemCount: upgradeItems.upgradeData.length,
      itemBuilder: (context, index) {
        if (upgradeItems.upgradeData[index].listCount < 10) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    height: context.height * 0.08,
                    width: context.width * 0.2,
                    child: Image.asset(
                      imagesLink[index],
                      color: imageColors[
                          upgradeItems.upgradeData[index].listCount],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: context.width * 0.63,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '${title[upgradeItems.upgradeData[index].listCount]} ${upgradeItems.upgradeData[index].upgradeItemName}',
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
                            upgradeItems.upgradeData[index].upgradeItemInfo,
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
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                      ),
                      onPressed: () async {
                        // 餅の所持数がアップグレードアイテム価格以上の場合
                        if (mochiCount.clickData.count >=
                                upgradeItems.upgradeData[index].upgradePrice &&
                            index == 0) {
                          // 現在の餅所持数からアップグレードアイテムの価格を引く
                          mochiCount.clickData.count -=
                              upgradeItems.upgradeData[index].upgradePrice;
                          // クリックをアップグレードバージョンに切り替えるフラグ
                          upgradeItems.upgradeData[index].upgradeFlag = 1;
                          // アチーブメント獲得
                          await achievementData.updateShouldShowImage(
                              upgradeItems.upgradeData[index].listCount +
                                  10 * index,
                              true);
                          // アップグレードアイテムの更新・通知
                          await upgradeItems.incrementUpgradeItems(index);
                          // 更新を通知
                          mochiCount.onlyNotify();
                          // 餅の所持数が足りない場合、画面に通知を表示
                        } else if (mochiCount.clickData.count >=
                                upgradeItems.upgradeData[index].upgradePrice &&
                            index != 0) {
                          // 現在の餅所持数からアップグレードアイテムの価格を引く
                          mochiCount.clickData.count -=
                              upgradeItems.upgradeData[index].upgradePrice;
                          if (shopItems.itemData[index - 1].itemCount != 0) {
                            // mps値を加算
                            mochiCount.clickData.mps +=
                                shopItems.itemData[index - 1].mpsRate *
                                    shopItems.itemData[index - 1].itemCount;
                            // アイテムのmps値を倍にする
                            shopItems.itemData[index - 1].mpsRate +=
                                shopItems.itemData[index - 1].mpsRate;
                          } else if (shopItems.itemData[index - 1].itemCount ==
                              0) {
                            // アイテムのmps値を倍にする
                            shopItems.itemData[index - 1].mpsRate +=
                                shopItems.itemData[index - 1].mpsRate;
                          }
                          // アチーブメント獲得
                          await achievementData.updateShouldShowImage(
                              upgradeItems.upgradeData[index].listCount +
                                  10 * index,
                              true);
                          // アップグレードアイテムの更新・通知
                          await upgradeItems.incrementUpgradeItems(index);
                          // 更新を通知
                          mochiCount.onlyNotify();
                        } else {
                          await showDialog<void>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 42, 157, 143),
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
                                        color:
                                            Color.fromARGB(255, 233, 196, 106),
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
                              customCompactFormatNoflout(
                                  upgradeItems.upgradeData[index].upgradePrice,
                                  0),
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
        } else {
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: context.height * 0.08,
                child: Text(
                  'Sold Out',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Corporate Logo Medium',
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 2.0,
                indent: 16.0,
                endIndent: 16.0,
              ),
            ],
          );
        }
      },
    );
  }
}
