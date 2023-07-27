import 'package:custom_nested_scroll_view/custom_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/custom_container/avatar.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/gen/assets.gen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: DefaultTabController(
        length: 5,
        child: CustomNestedScrollView(
          // use key to access CustomNestedScrollViewState
          // key: myKey,
          headerSliverBuilder: (context, innerScrolled) => <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Center(
                    child: Column(
                      children: [
                        _avatar(),
                        gapH12,
                        _name(),
                        gapH12,
                        _infoNum(),
                        gapH12,
                        _btnEdit(),
                        gapH12,
                        _description(),
                        gapH12,
                        _cart(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // use CustomOverlapAbsorber to wrap your SliverAppBar
            CustomOverlapAbsorber(sliver: const MySliverAppBar()),
          ],
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  // use CustomOverlapInjector on top of your inner CustomScrollView
                  CustomOverlapInjector(),
                  _tabBody1(),
                ],
              ),
              CustomScrollView(
                slivers: <Widget>[
                  // use CustomOverlapInjector on top of your inner CustomScrollView
                  CustomOverlapInjector(),
                  _tabBody1(),
                ],
              ),
              CustomScrollView(
                slivers: <Widget>[
                  // use CustomOverlapInjector on top of your inner CustomScrollView
                  CustomOverlapInjector(),
                  _tabBody1(),
                ],
              ),
              CustomScrollView(
                slivers: <Widget>[
                  // use CustomOverlapInjector on top of your inner CustomScrollView
                  CustomOverlapInjector(),
                  _tabBody1(),
                ],
              ),
              CustomScrollView(
                slivers: <Widget>[
                  // use CustomOverlapInjector on top of your inner CustomScrollView
                  CustomOverlapInjector(),
                  _tabBody1(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<CustomNestedScrollViewState> myKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   // use GlobalKey<CustomNestedScrollViewState> to access inner or outer scroll controller
    //   myKey.currentState?.innerController.addListener(() {
    //     final innerController = myKey.currentState!.innerController;
    //     print(
    //         '>>> Scrolling inner nested scrollview: ${innerController.positions}');
    //   });
    //   myKey.currentState?.outerController.addListener(() {
    //     final outerController = myKey.currentState!.outerController;
    //     print(
    //         '>>> Scrolling outer nested scrollview: ${outerController.positions}');
    //   });
    // });
  }

  Widget _tabBody1() {
    print('Render again');
    return SliverGrid.builder(
      // controller: scroll,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.75,
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: Center(child: Text('$index')),
            ),
            Positioned(
              bottom: 5,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow_outlined,
                      color: $constants.appColor.kWhite),
                  Text(
                    '2000',
                    style: TextStyle(
                      color: $constants.appColor.kWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPersistentHeader(
      pinned: true,
      delegate: _StickyTabBarDelegate(
        TabBar(
          indicatorColor: Colors.black,
          unselectedLabelColor: Color(0xFF808080),
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

PreferredSizeWidget _appBar() {
  return AppBar(
    leading: const Icon(Icons.monetization_on_sharp),
    backgroundColor: Colors.white, //your color,
    forceMaterialTransparency: true,
    centerTitle: true,
    title: const Text(
      'whisper...',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
        fontSize: 15,
      ),
    ),
    actions: [
      Assets.icons.png.footstep.image(height: 25),
      gapW16,
      const Icon(
        Icons.menu,
        color: Colors.black,
      ),
      gapW16,
    ],
  );
}

Stack _avatar() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      const Avatar(
        radius: 48,
        photoUrl:
            'https://www.facetofacemedical.com.au/wp-content/uploads/2021/12/Male-rejuvenation-01.jpg',
      ),
      Positioned(
        bottom: -8,
        right: -4,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: Container(
              height: 40,
              width: 20,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF1ed6f1),
                    Color(0xFF1be1c8),
                  ],
                ),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(0.4),
              child: const Icon(
                Icons.add,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Row _name() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        '@daiseymine',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      gapW4,
      Padding(
        padding: const EdgeInsets.only(bottom: 2.5),
        child: Icon(
          Icons.qr_code_2_sharp,
          size: 20,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
    ],
  );
}

Row _infoNum() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      _infoDisplay(info: '1956', title: 'Đang follow'),
      gapW12,
      const SizedBox(
        height: Sizes.p16,
        child: VerticalDivider(
          width: Sizes.p16,
          thickness: 0,
        ),
      ),
      gapW12,
      _infoDisplay(info: '175', title: 'Follower'),
      gapW12,
      const SizedBox(
        height: Sizes.p16,
        child: VerticalDivider(
          width: Sizes.p16,
          thickness: 0,
        ),
      ),
      gapW12,
      _infoDisplay(info: '859', title: 'Thích'),
    ],
  );
}

Column _infoDisplay({
  required String info,
  required String title,
}) {
  return Column(
    children: [
      Text(
        info,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      gapH4,
      Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 89, 87, 87),
        ),
      ),
    ],
  );
}

Row _cart() {
  return const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.red,
          ),
          gapW8,
          Text('Đơn hàng của bạn'),
        ],
      ),
      SizedBox(
        height: Sizes.p16,
        child: VerticalDivider(
          width: Sizes.p16,
          thickness: 0,
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.camera_enhance,
            color: Colors.red,
          ),
          gapW8,
          Text('Nối gót'),
        ],
      )
    ],
  );
}

Text _description() {
  return const Text("oh i'm just a boy");
}

Row _btnEdit() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      _btnCustom(callback: () {}, title: 'Sửa hồ sơ'),
      gapW8,
      _btnCustom(callback: () {}, title: 'Thêm bạn'),
    ],
  );
}

GestureDetector _btnCustom({
  required VoidCallback callback,
  required String title,
}) {
  return GestureDetector(
    onTap: callback,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xFFf1f1f1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p24,
          vertical: Sizes.p12,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: Sizes.p16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
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
