import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';
import 'package:tiktok/services/log_service/log_service.dart';

final LogService logIt = getIt<LogService>();
final SharedPreferences pref = getIt<SharedPreferences>();
// final EnvModel env = getIt<EnvModel>();
// final AppRouter appRouter = getIt<AppRouter>();
