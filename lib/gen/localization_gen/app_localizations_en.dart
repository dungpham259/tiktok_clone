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
  String get noConnectionError => 'Slow or no network connection. Please check your internet settings.';

  @override
  String get password => 'Password';

  @override
  String get serverError => 'Server error occured. Please try again later.';

  @override
  String get shortPasswordVerificationText => 'Password must have minimum of 6 characters';

  @override
  String get signIn => 'Sign In';

  @override
  String get signInStatusError => 'Failed getting sign in status';

  @override
  String get signOut => 'Sign Out';

  @override
  String get validEmailVerificationText => 'Please input a valid email address';

  @override
  String get emptyStringVerificationText => 'This field cannot be empty';

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
