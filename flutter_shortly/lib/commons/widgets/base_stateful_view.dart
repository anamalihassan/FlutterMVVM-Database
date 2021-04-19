import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class BaseStateFulView extends StatefulWidget {
  BaseStateFulView({Key key}) : super(key: key);

  @override
  BaseStateFulViewState createState() => BaseStateFulViewState();
}

class BaseStateFulViewState<T extends BaseStateFulView> extends State<T> {
  ProgressDialog pr;

  void showProgressLoader() async {
    await pr.show();
  }

  void hideProgressLoader() {
    pr.hide();
  }

  void prepareLoader() {
    pr = new ProgressDialog(context);
    pr.style(
        message: "Loading...",
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      prepareLoader();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}