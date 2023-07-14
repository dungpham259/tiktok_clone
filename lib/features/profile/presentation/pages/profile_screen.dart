import 'package:flutter/material.dart';
import 'package:tiktok/core/common_widgets/avatar.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/const.dart';
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
      body: _body(),
      // Center(
      //   child:
      // ),
    );
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
        Assets.icons.footstep.image(height: 25),
        gapW16,
        const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        gapW16,
      ],
    );
  }

  _avatar(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Avatar(
          radius: 48,
          photoUrl:
              "https://www.facetofacemedical.com.au/wp-content/uploads/2021/12/Male-rejuvenation-01.jpg",
        ),
        Positioned(
          bottom: -8,
          right: -4,
          child: Container(
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
                    gradient: LinearGradient(colors: [
                      Color(0xFF1ed6f1),
                      Color(0xFF1be1c8),
                    ]),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(0.4),
                  child: const Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
      ],
    );
  }

  _name(BuildContext context) {
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
        Icon(
          Icons.qr_code_2_sharp,
          size: 20,
          color: Colors.black.withOpacity(0.7),
        ),
      ],
    );
  }

  _infoNum(BuildContext context) {
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

  _infoDisplay({
    required String info,
    required String title,
  }) {
    return Column(
      children: [
        Text(
          info,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH8,
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

  _cart(BuildContext context) {
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

  _description(BuildContext context) {
    return const Text('oh i\'m just a boy');
  }

  _btnEdit(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _btnCustom(callback: () {}, title: 'Sửa hồ sơ'),
        gapW8,
        _btnCustom(callback: () {}, title: 'Thêm bạn'),
      ],
    );
  }

  _btnCustom({
    required VoidCallback callback,
    required String title,
  }) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFf1f1f1),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p24,
              vertical: Sizes.p12,
            ),
            child: Text(title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.p16,
                  fontWeight: FontWeight.w500,
                )),
          )),
    );
  }

  _body() {
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Center(
                      child: Column(
                        children: [
                          _avatar(context),
                          gapH12,
                          _name(context),
                          gapH12,
                          _infoNum(context),
                          gapH12,
                          _btnEdit(context),
                          gapH12,
                          _description(context),
                          gapH12,
                          _cart(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SliverPersistentHeader(
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
              ),
            ];
          },
          body: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
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
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Center(child: Text('$index')),
                    ),
                    const Positioned(
                        bottom: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.play_arrow_outlined, color: kWhite),
                            Text(
                              '2000',
                              style: TextStyle(
                                color: kWhite,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ))
                  ],
                );
              })),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: kWhite, child: tabBar);
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
