import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Transition/transition.dart';
import 'achievement_data.dart';

class Achievement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AchievementData achievementData = context.watch<AchievementData>();

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

    return Container(
      height: context.height * 0.2,
      padding: EdgeInsets.all(context.height * 0.025),
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(context.width * 0.8, context.height * 0.1),
          backgroundColor: const Color.fromARGB(255, 42, 157, 143),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'アチーブメント',
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
                content: Container(
                  height: context.height * 0.6,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: context.height * 0.6,
                      width: context.width * 0.8,
                      child: ListView.builder(
                        itemCount: achievementData.achievementData.length,
                        itemBuilder: (context, index) {
                          final item = achievementData.achievementData[index];
                          return ListTile(
                            leading: item.shouldShowImage
                                ? Image.asset(
                                    imagesLink[index ~/ 10],
                                    width: context.width * 0.08,
                                    color: imageColors[index % 10],
                                  )
                                : null,
                            title: item.shouldShowImage
                                ? Text(
                                    item.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    '???',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Corporate Logo Medium',
                                    ),
                                  ),
                            subtitle: item.shouldShowImage
                                ? FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      item.subTitle,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Corporate Logo Medium',
                                      ),
                                    ),
                                  )
                                : null,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Close',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 233, 196, 106),
                          fontSize: 16,
                          fontFamily: 'Corporate Logo Medium',
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
