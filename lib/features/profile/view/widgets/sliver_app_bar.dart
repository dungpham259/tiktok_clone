import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/constants.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _StickyTabBarDelegate(
        TabBar(
          indicatorColor: Colors.black,
          unselectedLabelColor: $constants.appColor.kUnSelectTabBar,
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(
                Icons.menu_rounded,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.lock,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.replay_outlined,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.save_as_rounded,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.favorite_border,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: $constants.appColor.kWhite,
      child: tabBar,
    );
  }
}
