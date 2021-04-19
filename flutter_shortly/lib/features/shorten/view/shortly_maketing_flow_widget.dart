import 'package:flutter/material.dart';
import 'package:flutter_shortly/commons/utils/app_colors.dart';
import 'package:flutter_shortly/commons/utils/app_font.dart';
import 'package:flutter_shortly/commons/utils/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShortlyMarketingFlowWidget extends StatefulWidget {
  ShortlyMarketingFlowWidget();

  @override
  _ShortlyMarketingFlowWidget createState() => _ShortlyMarketingFlowWidget();
}

class _ShortlyMarketingFlowWidget extends State<ShortlyMarketingFlowWidget> {
  _ShortlyMarketingFlowWidget();

  @override
  Widget build(BuildContext context) {
    return _buildAppFeaturesOverview();
  }

  Widget _buildAppFeaturesOverview() {
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildInfoView(AppLocalizations.of(context).translate('advanced_statics'),
              AppLocalizations.of(context).translate('track_links_msg')),
          _buildBrandRecognitionFeatureVew(),
          _buildVerticalDivider(),
          _buildDetailedRecordsFeatureVew(),
          _buildVerticalDivider(),
          _buildFullyCustomizableFeatureVew()
        ]);
  }

  Widget _buildBrandRecognitionFeatureVew() {
    return _buildFeatureView(
        'icon-brand-recognition',
        AppLocalizations.of(context).translate('brand_recognition'),
        AppLocalizations.of(context).translate('brand_recognition_msg'));
  }

  Widget _buildDetailedRecordsFeatureVew() {
    return _buildFeatureView(
        'icon-detailed-records',
        AppLocalizations.of(context).translate('detailed_records'),
        AppLocalizations.of(context).translate('brand_recognition_msg'));
  }

  Widget _buildFullyCustomizableFeatureVew() {
    return _buildFeatureView(
        'icon-fully-customizable',
        AppLocalizations.of(context).translate('fully_customizable'),
        AppLocalizations.of(context).translate('brand_recognition_msg'));
  }

  Widget _buildVerticalDivider() {
    return Container(
      color: AppColors.cyan,
      height: 55,
      width: 8,
    );
  }

  Widget _buildFeatureView(String imageName, String title, String subtitle) {
    final String assetName = 'assets/images/${imageName}.svg';
    final Widget svgIcon = SvgPicture.asset(
      assetName,
      height: 50,
      width: 50,
      fit: BoxFit.scaleDown,
    );
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: new Stack(
          children: <Widget>[
            // The containers in the background
            new Column(
              children: <Widget>[
                new Container(
                  height: 40,
                ),
                _buildInfoContainerView(title, subtitle),
              ],
            ),
            new Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(right: 20.0, left: 20.0),
              child: new Container(
                height: 80.0,
                width: 80,
                decoration: BoxDecoration(
                    color: AppColors.veryDarkBlue,
                    border: Border.all(
                      color: AppColors.veryDarkViolet,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: svgIcon,
              ),
            )
          ],
        ));
  }

  Widget _buildInfoContainerView(String title, String subtitle) {
    return Container(
        padding: EdgeInsets.only(top: 55, bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0), color: AppColors.white),
        child: _buildInfoView(title, subtitle));
  }

  Widget _buildInfoView(String title, String subtitle) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_buildTitleText(title), _buildSubTitleText(subtitle)]));
  }

  Widget _buildTitleText(String title) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppFonts.headlineSize2,
              fontFamily: AppFonts.extraBold,
              fontWeight: FontWeight.bold,
              color: AppColors.veryDarkViolet),
        ));
  }

  Widget _buildSubTitleText(String subtitle) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          subtitle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppFonts.subHeaderSize,
              fontFamily: AppFonts.extraBold,
              fontWeight: FontWeight.bold,
              color: AppColors.grayishViolet),
        ));
  }
}