import 'package:flutter/material.dart';
import 'package:flutter_shortly/commons/utils/app_colors.dart';
import 'package:flutter_shortly/commons/utils/app_font.dart';

Text headerTitleText(String title) {
  return Text(title,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: AppColors.headerThemeColor));
}

Image headerTitleImage({String imageName}) {
  return Image.asset('assets/images/${imageName}',
      height: 35,
      color: AppColors.white,
      fit: BoxFit.cover);
}

Widget titleDescText(String title) {
  return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Text(title,
          style: TextStyle(
              fontSize: AppFonts.bodySize,
              fontFamily: AppFonts.medium,
              color: AppColors.black,
              fontWeight: FontWeight.bold)));
}

Widget getVerticalBorder() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.black38,
        height: 60,
        width: 1,
      ));
}

Widget appPrimaryButton(String title, Function function) {
  return  ButtonTheme(
        minWidth: double.infinity,
        height: 50.0,
        child: RaisedButton(
          textColor: Colors.white,
          color: AppColors.cyan,
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFonts.titleSize,
                  fontFamily: AppFonts.medium,
                  color: AppColors.white)),
          onPressed: () {
            function();
          },
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(8.0),
          ),
        ),
      );
}

Widget appSecondaryButton(String title, Function function) {
  return Padding(
      key: Key(title.toLowerCase()),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 50.0,
        child: FlatButton(
          color: AppColors.white,
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFonts.bodySize,
                  fontFamily: AppFonts.medium,
                  color: AppColors.black70)),
          onPressed: () {
            function();
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4.0),
              side: BorderSide(
                  color: AppColors.black50,
                  width: 1,
                  style: BorderStyle.solid)),
        ),
      ));
}
