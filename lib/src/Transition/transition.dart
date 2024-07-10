import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mochi_clicker/src/play_session/play_session_screen.dart';
import 'package:mochi_clicker/src/shop/shop_screen.dart';
import 'package:mochi_clicker/src/status/status_screen.dart';
import 'package:intl/intl.dart';

import '../ads/banner_ad_widget.dart';
import '../status/click_counter.dart';

class Transition extends StatefulWidget {
  const Transition({Key? key}) : super(key: key);

  @override
  State<Transition> createState() => _Transition();
}

class _Transition extends State<Transition> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Theme(
        data: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            surfaceVariant: Colors.transparent,
          ),
        ),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: (context.height -
                          (context.safePaddingTop +
                              context.safePaddingBottom)) *
                      0.1,
                  color: const Color.fromARGB(255, 231, 111, 81),
                  child: ClickCounter(),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: context.width,
                  height: (context.height -
                          (context.safePaddingTop +
                              context.safePaddingBottom)) *
                      0.72,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: const [
                      PlaySessionScreen(),
                      ShopScreen(),
                      StatusScreen(),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: (context.height -
                          (context.safePaddingTop +
                              context.safePaddingBottom)) *
                      0.08,
                  color: const Color.fromARGB(255, 233, 196, 106),
                  child: TabBar(
                    labelColor: const Color.fromARGB(255, 42, 157, 143),
                    indicatorColor: Colors.transparent,
                    tabs: const <Widget>[
                      Tab(
                          icon: ImageIcon(
                              AssetImage('assets/images/スタンダードな家アイコン.png'),
                              size: 40)),
                      Tab(
                          icon: ImageIcon(
                              AssetImage('assets/images/ショップアイコン2.png'),
                              size: 40)),
                      Tab(
                          icon: ImageIcon(
                              AssetImage('assets/images/棒グラフのアイコン素材 その2.png'),
                              size: 40)),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height: (context.height -
                          (context.safePaddingTop +
                              context.safePaddingBottom)) *
                      0.1,
                  color: Colors.black,
                  child: BannerAdWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get safePaddingTop => MediaQuery.of(this).padding.top;
  double get safePaddingBottom => MediaQuery.of(this).padding.bottom;
}

String customCompactFormat(num number, int decimalPlaces) {
  final roundedNumber =
      (number * pow(10, decimalPlaces)).round() / pow(10, decimalPlaces);

  if (roundedNumber >= 1e21) {
    return '${(roundedNumber / 1e21).toStringAsPrecision(4)}Sx';
  } else if (roundedNumber >= 1e18) {
    return '${(roundedNumber / 1e18).toStringAsPrecision(4)}Qi';
  } else if (roundedNumber >= 1e15) {
    return '${(roundedNumber / 1e15).toStringAsPrecision(4)}Qa';
  } else if (roundedNumber >= 1e12) {
    return '${(roundedNumber / 1e12).toStringAsPrecision(4)}T';
  } else if (roundedNumber >= 1e9) {
    return '${(roundedNumber / 1e9).toStringAsPrecision(4)}B';
  } else if (roundedNumber >= 1e6) {
    return '${(roundedNumber / 1e6).toStringAsPrecision(4)}M';
  } else if (roundedNumber >= 1e3) {
    return '${(roundedNumber / 1e3).toStringAsPrecision(4)}K';
  } else {
    return roundedNumber.toString();
  }
}

String customCompactFormatNoflout(num number, int decimalPlaces) {
  final roundedNumber =
      (number * pow(10, decimalPlaces)).round() / pow(10, decimalPlaces);

  if (roundedNumber >= 1e21) {
    return '${(roundedNumber / 1e21).toStringAsFixed(decimalPlaces)}Sx';
  } else if (roundedNumber >= 1e18) {
    return '${(roundedNumber / 1e18).toStringAsFixed(decimalPlaces)}Qi';
  } else if (roundedNumber >= 1e15) {
    return '${(roundedNumber / 1e15).toStringAsFixed(decimalPlaces)}Qa';
  } else if (roundedNumber >= 1e12) {
    return '${(roundedNumber / 1e12).toStringAsFixed(decimalPlaces)}T';
  } else if (roundedNumber >= 1e9) {
    return '${(roundedNumber / 1e9).toStringAsFixed(decimalPlaces)}B';
  } else if (roundedNumber >= 1e6) {
    return '${(roundedNumber / 1e6).toStringAsFixed(decimalPlaces)}M';
  } else if (roundedNumber >= 1e3) {
    return '${(roundedNumber / 1e3).toStringAsFixed(decimalPlaces)}K';
  } else {
    return roundedNumber.toString();
  }
}
