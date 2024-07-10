import 'package:flutter/material.dart';
import 'package:mochi_clicker/src/shop/shop_item.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../status/click_counter.dart';
import '../status/timer_modell.dart';
import '../shop/upgrade_item.dart';
import '../achievement/achievement_data.dart';
import '../achievement/achievement_screen.dart';
import '../Transition/transition.dart';

// ステータスタブ
class StatusData extends StatelessWidget {
  const StatusData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerModel timerModel = context.read<TimerModel>();
    final ShopItems ItemsData = context.read<ShopItems>();
    final MochiClicker mochiCount = context.watch<MochiClicker>();
    final ShopItems shopData = context.watch<ShopItems>();
    final UpgradeItems upgradeData = context.watch<UpgradeItems>();
    final AchievementData achievementData = context.watch<AchievementData>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            '餅の総生産量：${customCompactFormat(mochiCount.clickData.totalCount, 1)}',
            style: TextStyle(
              fontSize: 28,
              color: const Color.fromARGB(255, 244, 162, 97),
              fontWeight: FontWeight.bold,
              fontFamily: 'Corporate Logo Medium',
            ),
          ),
        ),
        Container(
          child: Text(
            '総プレイ時間：${timerModel.counterDisplay}',
            style: TextStyle(
              fontSize: 28,
              color: const Color.fromARGB(255, 244, 162, 97),
              fontWeight: FontWeight.bold,
              fontFamily: 'Corporate Logo Medium',
            ),
          ),
        ),
        Container(
          child: Consumer<ShopItems>(
            builder: (context, state, _) => Text(
              '施設保持数：${ItemsData.getItemCountTotal()}',
              style: TextStyle(
                fontSize: 28,
                color: const Color.fromARGB(255, 244, 162, 97),
                fontWeight: FontWeight.bold,
                fontFamily: 'Corporate Logo Medium',
              ),
            ),
          ),
        ),
        Achievement(),
        Container(
          height: context.height * 0.2,
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(context.width * 0.7, context.height * 0.08),
                backgroundColor: const Color.fromARGB(255, 42, 157, 143),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'データ初期化',
                style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 233, 196, 106),
                  fontFamily: 'Corporate Logo Medium',
                ),
              ),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 42, 157, 143),
                      content: Text(
                        '本当にデータを初期化しますか？\n(総プレイ時間は初期化されません)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Corporate Logo Medium',
                        ),
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  0, 0, context.width * 0.05, 0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'キャンセル',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 233, 196, 106),
                                    fontSize: 16,
                                    fontFamily: 'Corporate Logo Medium',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  context.width * 0.05, 0, 0, 0),
                              child: TextButton(
                                onPressed: () {
                                  mochiCount.resetCounter();
                                  shopData.resetItems();
                                  upgradeData.resetUpgradeItems();
                                  achievementData.resetShouldShowImage();
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 231, 111, 81),
                                    fontSize: 16,
                                    fontFamily: 'Corporate Logo Medium',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
