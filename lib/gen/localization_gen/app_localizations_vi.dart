import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'TopTop';

  @override
  String get homeBottomNavigationBar => 'Trang chủ';

  @override
  String get shopBottomNavigationBar => 'Shop';

  @override
  String get inboxBottomNavigationBar => 'Hộp thư';

  @override
  String get userBottomNavigationBar => 'Hồ sơ';

  @override
  String get followingCountInfo => 'Đang follow';

  @override
  String get followerCountInfo => 'Follower';

  @override
  String get likeCountInfo => 'Thích';

  @override
  String get yourOrders => 'Đơn hàng của bạn';

  @override
  String get addYours => 'Nối gót';

  @override
  String get editProfile => 'Sửa hồ sơ';

  @override
  String get addFriends => 'Thêm bạn';

  @override
  String get creatorTools => 'Công cụ nhà phát triển';

  @override
  String get myQrCode => 'Mã QR của tôi';

  @override
  String get settingAndPrivacy => 'Cài đặt và chính sách';

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
    return 'Selamat datang $userName';
  }
}
