import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TikTok';

  @override
  String get homeBottomNavigationBar => 'Home';

  @override
  String get shopBottomNavigationBar => 'Shop';

  @override
  String get inboxBottomNavigationBar => 'Inbox';

  @override
  String get userBottomNavigationBar => 'Profile';

  @override
  String get followingCountInfo => 'Following';

  @override
  String get followerCountInfo => 'Follower';

  @override
  String get likeCountInfo => 'Likes';

  @override
  String get yourOrders => 'Your orders';

  @override
  String get addYours => 'Add Yours';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get addFriends => 'Add Friends';

  @override
  String get creatorTools => 'Creator tools';

  @override
  String get myQrCode => 'My QR code';

  @override
  String get appLanguage => 'App language';

  @override
  String get cancel => 'Cancel';

  @override
  String get done => 'Done';

  @override
  String get settingAndPrivacy => 'Setting and privacy';

  @override
  String pageSettingsInputLanguage(String locale) {
    String _temp0 = intl.Intl.selectLogic(
      locale,
      {
        'en': 'English',
        'vi': 'VietNamese',
        'other': '-',
      },
    );
    return '$_temp0';
  }

  @override
  String welcomeUser(Object userName) {
    return 'Welcome $userName';
  }
}
