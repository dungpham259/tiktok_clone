import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktok/modules/dependency_injection/di.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // Default.
  preferRelativeImports: true, // Default.
  asExtension: false, // Default.
)
Future<GetIt> configureDependencies() => init(getIt);
