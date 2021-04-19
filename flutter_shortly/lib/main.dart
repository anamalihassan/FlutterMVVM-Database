import 'package:flutter/material.dart';
import 'package:flutter_shortly/commons/config/app_config.dart';
import 'package:flutter_shortly/commons/config/locator.dart';
import 'package:flutter_shortly/commons/utils/app_language.dart';
import 'package:flutter_shortly/commons/utils/app_localizations.dart';
import 'package:flutter_shortly/features/shorten/view/shorten_home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {

  AppLanguage appLanguage = AppLanguage();
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  String env = String.fromEnvironment("env");
  print(env);
  env = 'prod';
  await AppConfig.forEnvironment(env, false);
  runApp(MyApp(appLanguage: appLanguage));
}

class MyApp extends StatelessWidget {

  final AppLanguage appLanguage;
  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AppLanguage>(
      builder: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return MaterialApp(
            locale: model.appLocal,
            supportedLocales: [
              Locale('en', 'US'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            debugShowCheckedModeBanner: false,
            title: 'noqodi',
            home: ShortenHomeView(),
            routes: {
              '/home': (context) => ShortenHomeView(),
            }
        );
      }),
    );
  }
}



