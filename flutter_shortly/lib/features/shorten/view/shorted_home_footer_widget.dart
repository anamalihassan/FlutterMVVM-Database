import 'package:flutter/material.dart';
import 'package:flutter_shortly/commons/utils/app_colors.dart';
import 'package:flutter_shortly/commons/utils/app_font.dart';
import 'package:flutter_shortly/commons/utils/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShortlyHomeFooterWidget extends StatefulWidget {
  ShortlyHomeFooterWidget();

  @override
  _ShortlyHomeFooterWidget createState() => _ShortlyHomeFooterWidget();
}

class _ShortlyHomeFooterWidget extends State<ShortlyHomeFooterWidget> {
  _ShortlyHomeFooterWidget();

  @override
  Widget build(BuildContext context) {
    return _buildShortlyFooterView();
  }

  Widget _buildShortlyFooterView() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: MediaQuery.of(context).size.width,
        color: AppColors.veryDarkViolet,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildShortlyText(),
              _buildAppInfoFeatures(),
              _buildAppInfoResources(),
              _buildAppInfoCompany(),
              _buildSocialMediaButtons()
            ]));
  }

  Widget _buildShortlyText() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Text(
          AppLocalizations.of(context).translate('shortly'),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppFonts.headlineSize2,
              fontFamily: AppFonts.extraBold,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        ));
  }

  Widget _buildSocialMediaButtons() {
    final Widget facebookIcon = SvgPicture.asset(
      'assets/images/icon-facebook.svg',
    );
    final Widget twitterIcon = SvgPicture.asset(
      'assets/images/icon-twitter.svg',
    );
    final Widget pinterestIcon = SvgPicture.asset(
      'assets/images/icon-pinterest.svg',
    );
    final Widget instagramIcon = SvgPicture.asset(
      'assets/images/icon-instagram.svg',
    );
    return Padding(
        padding: EdgeInsets.only(top: 24),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          facebookIcon,
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: twitterIcon),
          Padding(padding: EdgeInsets.only(right: 16), child: pinterestIcon),
          instagramIcon
        ]));
  }

  Widget _buildAppInfoFeatures() {
    String title = AppLocalizations.of(context).translate('features');
    List<String> options = [
      AppLocalizations.of(context).translate('link_shortening'),
      AppLocalizations.of(context).translate('branded_links'),
      AppLocalizations.of(context).translate('analytics')
    ];
    return _buildAppInfoView(title, options);
  }

  Widget _buildAppInfoResources() {
    String title = AppLocalizations.of(context).translate('resources');
    List<String> options = [
      AppLocalizations.of(context).translate('blog'),
      AppLocalizations.of(context).translate('developers'),
      AppLocalizations.of(context).translate('support')
    ];
    return _buildAppInfoView(title, options);
  }

  Widget _buildAppInfoCompany() {
    String title = AppLocalizations.of(context).translate('company');
    List<String> options = [
      AppLocalizations.of(context).translate('about'),
      AppLocalizations.of(context).translate('our_team'),
      AppLocalizations.of(context).translate('careers'),
      AppLocalizations.of(context).translate('contact')
    ];
    return _buildAppInfoView(title, options);
  }

  Widget _buildAppInfoView(String title, List<String> options) {
    var widgets = <Widget>[];
    widgets.add(Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppFonts.titleSize,
              fontFamily: AppFonts.extraBold,
              fontWeight: FontWeight.bold,
              color: AppColors.white),
        )));
    for (String option in options) {
      widgets.add(Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            option,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppFonts.subHeaderSize,
                fontFamily: AppFonts.bold,
                color: AppColors.gray),
          )));
    }
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets);
  }
}
