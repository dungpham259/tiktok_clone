import 'package:custom_nested_scroll_view/custom_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/core/common_widgets/bottom_sheet/app_bottom_sheet_types.dart';
import 'package:tiktok/core/common_widgets/bottom_sheet/app_bottom_sheet_widget.dart';
import 'package:tiktok/core/common_widgets/custom_container/avatar.dart';
import 'package:tiktok/core/common_widgets/text_show/text_show_horizontal.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';
import 'package:tiktok/features/profile/view/widgets/sliver_app_bar.dart';
import 'package:tiktok/gen/assets.gen.dart';
import 'package:tiktok/l10n/l10n.dart';
import 'package:tiktok/router/app_router.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          print('object');
        },
        child: DefaultTabController(
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
                          gapH8,
                          _btnEdit(),
                          gapH8,
                          _description(),
                          gapH8,
                          _cart(),
                          gapH12,
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
              children: List.generate(
                5,
                (index) => CustomScrollView(
                  slivers: <Widget>[
                    // use CustomOverlapInjector on top of your inner CustomScrollView
                    CustomOverlapInjector(),
                    _tabBody1(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final GlobalKey<CustomNestedScrollViewState> myKey = GlobalKey();

  @override
  void initState() {
    super.initState();
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

  PreferredSizeWidget _appBar() {
    final localizations = context.localizations;
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
        InkWell(
          onTap: () {
            AppBottomSheet.show(
              context,
              appBottomSheetType: AppBottomSheetType.flexContent,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextShowHorizontal(
                        content: localizations.creatorTools,
                        icon: Icon(Icons.person_search_sharp),
                        textStyle: context.textTheme.titleMedium,
                      ),
                      Divider(
                        thickness: 0,
                        height: Sizes.p20,
                        color: $constants.appColor.kTextColor1.withOpacity(0.5),
                      ),
                      TextShowHorizontal(
                        content: localizations.myQrCode,
                        icon: Icon(Icons.qr_code),
                        textStyle: context.textTheme.titleMedium,
                      ),
                      Divider(
                        thickness: 0,
                        height: Sizes.p20,
                        color: $constants.appColor.kTextColor1.withOpacity(0.5),
                      ),
                      TextShowHorizontal(
                        content: localizations.settingAndPrivacy,
                        icon: Icon(Icons.settings_applications_sharp),
                        textStyle: context.textTheme.titleMedium,
                        onTap: () {
                          context.pop();
                          context.push(AppRouter.settingPath);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: $constants.appColor.kWhite,
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
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: $constants.appColor.kWhite,
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
        Text(
          '@daiseymine',
          style: context.textTheme.titleMedium!.copyWith(
            fontSize: 19,
          ),
        ),
        gapW4,
        Padding(
          padding: const EdgeInsets.only(bottom: 1.5),
          child: Icon(
            Icons.qr_code_2_sharp,
            size: 20,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }

  Row _infoNum() {
    final localizations = context.localizations;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _infoDisplay(
          info: '1956',
          title: localizations.followingCountInfo,
        ),
        gapW12,
        const SizedBox(
          height: Sizes.p16,
          child: VerticalDivider(
            width: Sizes.p16,
            thickness: 0,
          ),
        ),
        gapW12,
        _infoDisplay(
          info: '175',
          title: localizations.followerCountInfo,
        ),
        gapW12,
        const SizedBox(
          height: Sizes.p16,
          child: VerticalDivider(
            width: Sizes.p16,
            thickness: 0,
          ),
        ),
        gapW12,
        _infoDisplay(
          info: '859',
          title: localizations.likeCountInfo,
        ),
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
          style: context.textTheme.titleLarge!.copyWith(
            fontSize: 18,
          ),
        ),
        gapH4,
        Text(
          title,
          style: context.textTheme.bodyMedium!.copyWith(
            color: $constants.appColor.kTextColor1,
          ),
        ),
      ],
    );
  }

  Row _cart() {
    final localizations = context.localizations;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextShowHorizontal(
          content: localizations.yourOrders,
          textStyle: context.textTheme.titleMedium!.copyWith(
            fontSize: 15,
          ),
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: Sizes.p16,
          child: VerticalDivider(
            width: Sizes.p16,
            thickness: 0,
          ),
        ),
        TextShowHorizontal(
          content: localizations.addYours,
          textStyle: context.textTheme.titleMedium!.copyWith(
            fontSize: 15,
          ),
          icon: Icon(
            Icons.camera_enhance,
            color: Colors.red,
          ),
        ),
      ],
    );
  }

  Text _description() {
    return const Text("oh i'm just a boy");
  }

  Row _btnEdit() {
    final localizations = context.localizations;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _btnCustom(
          callback: () {},
          title: localizations.editProfile,
        ),
        gapW8,
        _btnCustom(
          callback: () {},
          title: localizations.addFriends,
        ),
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
          child: Text(title,
              style: context.textTheme.titleMedium!.copyWith(
                fontSize: 16,
              )),
        ),
      ),
    );
  }
}
