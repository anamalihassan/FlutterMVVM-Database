import 'package:flutter_shortly/features/shorten/service/database_service.dart';
import 'package:flutter_shortly/features/shorten/service/shorten_service.dart';
import 'package:flutter_shortly/features/shorten/view/shorten_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton<ShortenService>(() => ShortenService());
  locator.registerLazySingleton<DatabaseService>(() => DatabaseService());
  locator.registerFactory(() => ShortenViewModel());

}
