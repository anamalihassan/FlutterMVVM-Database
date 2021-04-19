import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  String baseApiUrl;
  String currentEnv;

  AppConfig({this.baseApiUrl, this.currentEnv});

  static AppConfig _appConfig;

  static AppConfig get instance {
    return _appConfig;
  }

  static Future<AppConfig> forEnvironment(String env, bool isGVPay) async {
    print('Environment=' + env);
    final contents = await rootBundle.loadString(
      'assets/env/$env.json',
    );
    final json = jsonDecode(contents);
    _appConfig = AppConfig(baseApiUrl: json['baseApiUrl'], currentEnv: env);
    return _appConfig;
  }
}
