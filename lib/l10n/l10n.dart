import 'package:flutter/widgets.dart';
import 'package:tiktok/gen/localization_gen/app_localizations.dart';

export 'package:tiktok/gen/localization_gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);
}
