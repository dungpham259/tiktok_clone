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
  String get noConnectionError => 'Sambungan jaringan lambat atau sedang tidak tersedia. Silakan periksa pengaturan internet anda.';

  @override
  String get password => 'Kata sandi';

  @override
  String get serverError => 'Terjadi kesalahan server. Silakan coba lagi nanti.';

  @override
  String get shortPasswordVerificationText => 'Kata sandi harus memiliki minimal 6 karakter';

  @override
  String get signIn => 'Masuk';

  @override
  String get signInStatusError => 'Gagal saat mendapatkan status sign in';

  @override
  String get signOut => 'Keluar';

  @override
  String get validEmailVerificationText => 'Harap masukkan alamat email yang valid';

  @override
  String get emptyStringVerificationText => 'Bagian ini tidak boleh kosong';

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
