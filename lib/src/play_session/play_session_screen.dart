import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../click_button/click_button.dart';
import '../Transition/transition.dart';
import '../shop/shop_item.dart';

class PlaySessionScreen extends StatefulWidget {
  const PlaySessionScreen({Key? key}) : super(key: key);

  @override
  State<PlaySessionScreen> createState() => _PlaySessionScreen();
}

class _PlaySessionScreen extends State<PlaySessionScreen> {
  @override
  Widget build(BuildContext context) {
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

    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: context.width,
          color: Color.fromARGB(255, 233, 196, 106),
          child: Text(
            '各施設所持数',
            style: TextStyle(
              color: Color.fromARGB(255, 38, 70, 83),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Corporate Logo Medium',
            ),
          ),
        ),
        Container(
          height: context.height * 0.003,
          width: context.width,
          color: Color.fromARGB(255, 38, 70, 83),
          child: Text(''),
        ),
        Flexible(
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            height: ((context.height -
                        (context.safePaddingTop + context.safePaddingBottom)) *
                    0.72) *
                0.6,
            color: const Color.fromARGB(255, 244, 162, 97),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.fromLTRB(0, context.height * 0.005, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          width: context.width / 6,
                          child: Column(
                            children: [
                              Image.asset(imagesLink[index * 6]),
                              Text(
                                '${shopItems.itemData[index * 6].itemCount}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 38, 70, 83),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: context.width / 6,
                          child: Column(
                            children: [
                              Image.asset(imagesLink[index * 6 + 1]),
                              Text(
                                '${shopItems.itemData[index * 6 + 1].itemCount}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 38, 70, 83),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: context.width / 6,
                          child: Column(
                            children: [
                              Image.asset(imagesLink[index * 6 + 2]),
                              Text(
                                '${shopItems.itemData[index * 6 + 2].itemCount}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 38, 70, 83),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: context.width / 6,
                          child: Column(
                            children: [
                              Image.asset(imagesLink[index * 6 + 3]),
                              Text(
                                '${shopItems.itemData[index * 6 + 3].itemCount}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 38, 70, 83),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: context.width / 6,
                          child: Column(
                            children: [
                              Image.asset(imagesLink[index * 6 + 4]),
                              Text(
                                '${shopItems.itemData[index * 6 + 4].itemCount}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 38, 70, 83),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: context.width / 6,
                          child: Column(
                            children: [
                              Image.asset(imagesLink[index * 6 + 5]),
                              Text(
                                '${shopItems.itemData[index * 6 + 5].itemCount}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 38, 70, 83),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Corporate Logo Medium',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ),
        Container(
          height: context.height * 0.003,
          width: context.width,
          color: Color.fromARGB(255, 38, 70, 83),
          child: Text(''),
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: ((context.height -
                      (context.safePaddingTop + context.safePaddingBottom)) *
                  0.72) *
              0.4,
          color: const Color.fromARGB(255, 42, 157, 143),
          child: ClickButton(),
        ),
      ],
    );
  }
}
