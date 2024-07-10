import 'package:flutter/material.dart';

import '../Transition/transition.dart';
import '../shop/items_screen.dart';
import '../shop/upgrade_screen.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: context.height * 0.72,
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              surfaceVariant: Colors.transparent,
            ),
          ),
          child: Scaffold(
            body: Container(
              alignment: Alignment.topCenter,
              width: context.width,
              height: context.height * 0.72,
              color: const Color.fromARGB(255, 42, 157, 143),
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyTabBarDelegate(
                        tabBar: TabBar(
                          labelColor: const Color.fromARGB(255, 42, 157, 143),
                          indicatorColor: Colors.transparent,
                          tabs: const [
                            Tab(
                              icon: 
                              ImageIcon(
                                  AssetImage('assets/images/ショップアイコン6.png'),
                                  size: 40),
                            ),
                            Tab(
                              icon: ImageIcon(
                                  AssetImage('assets/images/スパナとドライバーで設定アイコンの誕生.png'),
                                  size: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: const [
                    ItemsScreen(),
                    UpgradeScreen(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: const Color.fromARGB(255, 233, 196, 106),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
