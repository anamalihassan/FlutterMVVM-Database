
import 'package:flutter_shortly/features/shorten/model/shorten_result.dart';
import 'package:flutter_shortly/features/shorten/service/database_service.dart';
import 'package:flutter_shortly/commons/config/locator.dart';
import 'package:flutter_shortly/commons/utils/field_validator.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_api_response.dart';
import 'package:flutter_shortly/features/shorten/service/shorten_service.dart';

class ShortenViewModel with FieldValidator {

  var shortenService = locator<ShortenService>();
  var databaseService = locator<DatabaseService>();

  List<ShortenResult> _shortenURLList;

  List<ShortenResult> get shortenURLList {
    return _shortenURLList;
  }

  bool validateAndSave(_viewState) {
    final form = _viewState.formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<ShortenAPIResponse> callShortenURLAPI(String url) async {
    ShortenAPIResponse shortenAPIResponse = await shortenService.shortenURL(url);
    if(shortenAPIResponse.ok){
      bool insertSuccess = await databaseService.insertShortenURL(shortenAPIResponse.result);
      if(insertSuccess){
        _shortenURLList = await databaseService.getAllShortenURLs();
      }
    }
    return shortenAPIResponse;
  }

  Future<bool> getAllShortenURLs() async {
    _shortenURLList = await databaseService.getAllShortenURLs();
    return true;
  }

}