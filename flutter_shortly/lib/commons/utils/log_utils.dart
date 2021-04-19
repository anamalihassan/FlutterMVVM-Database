import 'dart:convert';
import 'dart:developer' as d;

import 'package:flutter_shortly/commons/config/app_config.dart';

class LogUtils {
  static void logWith(String prefix, dynamic message) {
    if (AppConfig.instance.currentEnv == "prod") {
      d.log(prefix + JsonEncoder.withIndent('  ').convert(message));
    }
  }

  static void log(dynamic message) {
    if (AppConfig.instance.currentEnv == "prod") {
      d.log(JsonEncoder.withIndent('  ').convert(message));
    }
  }

  static void printLog(dynamic message) {
    if (AppConfig.instance.currentEnv == "prod") {
      print(message);
    }
  }
}
