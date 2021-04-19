import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_shortly/commons/config/app_config.dart';
import 'package:flutter_shortly/commons/utils/log_utils.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_api_response.dart';
import 'package:flutter_shortly/features/shorten/service/api/shorten_api_client.dart';

class ShortenService {

  Future<ShortenAPIResponse> shortenURL(String url) async {
    ShortenAPIResponse shortenAPIResponse;
    try {
      shortenAPIResponse = await (await _createAPIClient())
          .shortenURL(url);
      LogUtils.logWith('shortenAPIResponse:', shortenAPIResponse.toJson());
    } on DioError catch (e) {
      shortenAPIResponse = ShortenAPIResponse.fromJson(jsonDecode(e.response.toString()));
      LogUtils.printLog(shortenAPIResponse.error);
      LogUtils.printLog(e.response);
    } catch (e) {
      LogUtils.printLog(e.toString());
      LogUtils.printLog(e);
    }
    return shortenAPIResponse;
  }

  Future<ShortenApiClient> _createAPIClient() async {
    Dio dio = new Dio();
    return new ShortenApiClient(dio, baseUrl: AppConfig.instance.baseApiUrl);
  }
}