import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/app_sizes.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';
import 'package:tiktok/features/settings_privacy/view/widgets/container_setting.dart';

class SettingAndPrivacyPage extends StatefulWidget {
  const SettingAndPrivacyPage({super.key});

  @override
  State<SettingAndPrivacyPage> createState() => _SettingAndPrivacyPageState();
}

class _SettingAndPrivacyPageState extends State<SettingAndPrivacyPage> {
  late ScrollController _scrollController;
  late double _scrollPosition = 0.0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: $constants.appColor.kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _scrollPosition > 42 ? Text('Settings and privacy') : null,
        // scrolledUnderElevation: 0.0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: $constants.appColor.kBackgroundColor,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Sizes.p8),
                  child: Text(
                    'Settings and privacy',
                    style: context.textTheme.titleMedium!.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                gapH32,
                _accountSetting(),
                gapH32,
                _contentDisplaySetting(),
                gapH32,
                _cacheCellular(),
                gapH32,
                _login(),
                gapH48,
                Center(
                  child: Text(
                    'v1.0',
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: $constants.appColor.kTextColor2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _accountSetting() {
    return ContainerSettings(
      title: 'Account',
      widget: [
        OptionSettings(
          title: 'Account',
          icon: Icons.person,
        ),
        gapH32,
        OptionSettings(
          title: 'Privacy',
          icon: Icons.lock,
        ),
        gapH32,
        OptionSettings(
          title: 'Security',
          icon: Icons.shield,
        ),
        gapH32,
        OptionSettings(
          title: 'Your orders',
          icon: Icons.shopping_cart,
        ),
        gapH32,
        OptionSettings(
          title: 'Balance',
          icon: Icons.credit_card,
        ),
        gapH32,
        OptionSettings(
          title: 'Share profile',
          icon: Icons.share,
        ),
      ],
    );
  }

  Widget _contentDisplaySetting() {
    return ContainerSettings(
      title: 'Content & Display',
      widget: [
        OptionSettings(
          title: 'Notifications',
          icon: Icons.notifications,
        ),
        gapH32,
        OptionSettings(
          title: 'LIVE',
          icon: Icons.live_tv_sharp,
        ),
        gapH32,
        OptionSettings(
          title: 'Comment and watch history',
          icon: Icons.watch_later,
        ),
        gapH32,
        OptionSettings(
          title: 'Content preferences',
          icon: Icons.camera_indoor_outlined,
        ),
        gapH32,
        OptionSettings(
          title: 'Ads',
          icon: Icons.ads_click_sharp,
        ),
        gapH32,
        OptionSettings(
          title: 'Playback',
          icon: Icons.play_circle_fill_outlined,
        ),
        gapH32,
        OptionSettings(
          title: 'Language',
          icon: Icons.language,
          onTap: () {},
        ),
        gapH32,
        OptionSettings(
          title: 'Screen time',
          icon: Icons.screenshot_sharp,
        ),
        gapH32,
        OptionSettings(
          title: 'Family Pairing',
          icon: Icons.home,
        ),
        gapH32,
        OptionSettings(
          title: 'Accessiblity',
          icon: Icons.accessibility,
        ),
      ],
    );
  }

  Widget _cacheCellular() {
    return ContainerSettings(
      title: 'Cache & Cellular',
      widget: [
        OptionSettings(
          title: 'Free up space',
          icon: Icons.delete,
        ),
        gapH32,
        OptionSettings(
          title: 'Data Saver',
          icon: Icons.data_exploration_rounded,
        ),
        gapH32,
        OptionSettings(
          title: 'Wallpaper',
          icon: Icons.wallpaper,
        ),
      ],
    );
  }

  Widget _login() {
    return ContainerSettings(
      title: 'Login',
      widget: [
        OptionSettings(
          title: 'Switch account',
          icon: Icons.change_circle_sharp,
        ),
        gapH32,
        OptionSettings(
          title: 'Log out',
          icon: Icons.logout,
        ),
      ],
    );
  }
}
