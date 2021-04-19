import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shortly/commons/utils/app_alerts.dart';
import 'package:flutter_shortly/commons/utils/app_colors.dart';
import 'package:flutter_shortly/commons/utils/app_font.dart';
import 'package:flutter_shortly/commons/utils/app_localizations.dart';
import 'package:flutter_shortly/commons/utils/field_validator.dart';
import 'package:flutter_shortly/commons/widgets/base_common_widgets.dart';
import 'package:flutter_shortly/commons/widgets/base_stateful_view.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_api_response.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_result.dart';
import 'package:flutter_shortly/features/shorten/view/shorted_home_footer_widget.dart';
import 'package:flutter_shortly/features/shorten/view/shorten_view_model.dart';
import 'package:flutter_shortly/features/shorten/view/shortly_maketing_flow_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShortenHomeView extends BaseStateFulView {
  @override
  _ShortenHomeViewState createState() => _ShortenHomeViewState();
}

class _ShortenHomeViewState extends BaseStateFulViewState<ShortenHomeView> {
  String _urlInput;
  final formKey = GlobalKey<FormState>();
  ShortenViewModel _viewModel = ShortenViewModel();
  List<ShortenResult> _shortenURLList = [];
  var urlInputTC = TextEditingController();
  int _currentCoppied = -1;

  void callShorten() async {
    if (_viewModel.validateAndSave(this)) {
      await showProgressLoader();
      ShortenAPIResponse _shortenAPIResponse =
          await _viewModel.callShortenURLAPI(_urlInput);
      hideProgressLoader();
      if (_shortenAPIResponse.ok) {
        urlInputTC.text = "";
        updateShortenList();
        AppAlerts.showSuccessInfoSnackBar(context,
            message: "URL has been shortened.");
      } else {
        AppAlerts.showErrorInfoSnackBar(context,
            message: _shortenAPIResponse.error);
      }
    }
  }

  void updateShortenList() {
    setState(() {
      _shortenURLList = _viewModel.shortenURLList;
    });
  }

  void getAllShortenURLs() async {
    bool fetched = await _viewModel.getAllShortenURLs();
    if (fetched) {
      updateShortenList();
    }
  }

  @override
  void dispose() {
    urlInputTC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllShortenURLs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey[300], body: _buildMainView());
  }

  Widget _buildMainView() {
    return new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: new SingleChildScrollView(child: buildMainView()));
  }

  Widget buildMainView() {
    return new Container(
        padding: const EdgeInsets.only(top: 36),
        child: new Form(
            key: formKey,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTitleRow()),
                _buildWorkingImage(),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildHomeAdTitle(AppLocalizations.of(context)
                              .translate('home_ad_title')),
                          _buildHomeAdSubTitle(AppLocalizations.of(context)
                              .translate('home_ad_description')),
                          _buildGetStartedButton(AppLocalizations.of(context)
                              .translate('get_started')),
                          _buildShortenInputBox(),
                          _buildShortenURLList(),
                          ShortlyMarketingFlowWidget(),
                        ])),
                _buildBoostLinkView(),
                ShortlyHomeFooterWidget()
              ],
            )));
  }

  Widget _buildBoostLinkView() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 80),
        width: MediaQuery.of(context).size.width,
        color: AppColors.darkViolet,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildBoostLinksText(),
              _buildGetStartedButton(
                  AppLocalizations.of(context).translate('get_started'))
            ]));
  }

  Widget _buildBoostLinksText() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Text(
          AppLocalizations.of(context).translate('boost_links'),
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

  Widget _buildTitleRow() {
    return Padding(
        padding: EdgeInsets.only(top: 24),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_buildLogoImage(), _buildMenuButton()]));
  }

  Widget _buildLogoImage() {
    final String assetName = 'assets/images/logo.svg';
    final Widget svgIcon = SvgPicture.asset(
      assetName,
    );
    return svgIcon;
  }

  Widget _buildWorkingImage() {
    final String assetName = 'assets/images/illustration-working.svg';
    final Widget svgIcon = SvgPicture.asset(
      assetName,
      width: MediaQuery.of(context).size.width * 1.4,
      alignment: Alignment.centerLeft,
      fit: BoxFit.cover,
    );
    return svgIcon;
  }

  Widget _buildMenuButton() {
    return GestureDetector(
      onTap: () {
        _showDialog(context);
      },
      child: Icon(Icons.menu_outlined),
    );
  }

  Widget _buildHomeAdTitle(String title) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Text(
          title,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppFonts.headlineSize,
              fontFamily: AppFonts.extraBold,
              fontWeight: FontWeight.bold,
              color: AppColors.veryDarkViolet),
        ));
  }

  Widget _buildHomeAdSubTitle(String subtitle) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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

  Widget _buildGetStartedButton(String title) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.0),
                color: AppColors.cyan),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 36),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: AppFonts.titleSize,
                    fontFamily: AppFonts.extraBold,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
            )));
  }

  Widget _buildShortenInputBox() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: AppColors.veryDarkBlue),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [_buildURLInput(), _buildShotenItButton()]),
            )));
  }

  Widget _buildURLInput() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: AppColors.white),
            child: TextFormField(
                key: Key('url'),
                controller: urlInputTC,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.red, width: 5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.white, width: 5.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: AppLocalizations.of(context)
                        .translate('shorten_link_here')),
                keyboardType: TextInputType.text,
                validator: (String value) {
                  return FieldValidator.validateURL(value);
                },
                onSaved: (String value) => _urlInput = value)));
  }

  Widget _buildShotenItButton() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: appPrimaryButton(
            AppLocalizations.of(context).translate('shorten_it'), callShorten));
  }

  Widget _buildShortenURLList() {
    var widgets = <Widget>[];
    if (_shortenURLList != null && _shortenURLList.length > 0) {
      for (ShortenResult shortenResult in _shortenURLList) {
        widgets.add(Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: _buildShortedListItemWidget(shortenResult)));
      }
    }
    return new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets);
  }

  Widget _buildShortedListItemWidget(ShortenResult shortenResult) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0), color: AppColors.white),
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buiildOriginalURLText(shortenResult),
            Divider(
              height: 4,
              color: AppColors.gray,
            ),
            _buiildShortedURLText(shortenResult),
            _buildCopyButton(shortenResult)
          ]),
    );
  }

  Widget _buiildOriginalURLText(ShortenResult shortenResult) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(children: [
          Flexible(
              child: Text(
            shortenResult.original_link,
            maxLines: 5,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: AppFonts.titleSize,
                fontFamily: AppFonts.extraBold,
                fontWeight: FontWeight.bold,
                color: AppColors.darkViolet),
          ))
        ]));
  }

  Widget _buiildShortedURLText(ShortenResult shortenResult) {
    return Padding(
        padding: EdgeInsets.only(top: 8, left: 16, right: 10),
        child: Row(
          children: [
            Flexible(
                child: Text(
              shortenResult.short_link,
              maxLines: 5,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: AppFonts.titleSize,
                  fontFamily: AppFonts.extraBold,
                  fontWeight: FontWeight.bold,
                  color: AppColors.cyan),
            ))
          ],
        ));
  }

  Widget _buildCopyButton(ShortenResult shortenResult) {
    String title = shortenResult.id == _currentCoppied
        ? AppLocalizations.of(context).translate('copied')
        : AppLocalizations.of(context).translate('copy');
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ButtonTheme(
          minWidth: double.infinity,
          height: 50.0,
          child: RaisedButton(
            textColor: AppColors.white,
            color: shortenResult.id == _currentCoppied ? AppColors.darkViolet : AppColors.cyan,
            child: Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppFonts.titleSize,
                    fontFamily: AppFonts.medium,
                    color: AppColors.white)),
            onPressed: () {
              copyButtonPressed(shortenResult);
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
            ),
          ),
        ));
  }

  void copyButtonPressed(ShortenResult shortenResult) {
    Clipboard.setData(new ClipboardData(text: shortenResult.short_link));
    setState(() {
      _currentCoppied = shortenResult.id;
    });
  }

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return alert dialog object
        return AlertDialog(
          backgroundColor: AppColors.veryDarkBlue,
          content: Container(
            height: 350,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            color: AppColors.veryDarkBlue,
            child: Column(
              children: <Widget>[
                _getMenuItem("Features"),
                _getMenuItem("Pricing"),
                _getMenuItem("Resources"),
                Divider(
                  color: AppColors.white,
                ),
                _getMenuItem("Login"),
                _buildGetStartedButton(
                    AppLocalizations.of(context).translate('signup'))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getMenuItem(String title) {
    return new FlatButton(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFonts.titleSize,
                  fontFamily: AppFonts.medium,
                  color: AppColors.white))),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
