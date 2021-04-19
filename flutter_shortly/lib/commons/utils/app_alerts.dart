import 'package:flutter/material.dart';
import 'package:flutter_shortly/commons/utils/app_colors.dart';
import 'package:flutter_shortly/commons/utils/flushbar/flushbar.dart';

class AppAlerts {
  static showSuccessInfoSnackBar(BuildContext context, {String title, @required String message}) {
    Flushbar(
      backgroundColor: AppColors.green,
      title: title,
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: AppColors.white,
      ),
      leftBarIndicatorColor: AppColors.greenDark,
      duration: Duration(seconds: 3),
    )..show(context);
  }

  static showErrorInfoSnackBar(BuildContext context, {String title, @required String message}) {
    Flushbar(
      backgroundColor: AppColors.red,
      title: title,
      message: message,
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Colors.white,
      ),
      leftBarIndicatorColor: AppColors.orange,
      duration: Duration(seconds: 3),
    )..show(context);
  }
}