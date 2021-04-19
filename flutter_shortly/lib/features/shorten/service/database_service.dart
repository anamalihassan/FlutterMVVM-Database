

import 'package:flutter_shortly/commons/utils/log_utils.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_result.dart';
import 'package:flutter_shortly/features/shorten/service/database/shorten_database.dart';

class DatabaseService {

  Future<bool> insertShortenURL(ShortenResult shortenResult) async {
    bool success = false;
    try {
      await ShortenDBProvider.db.insertShortenURL(shortenResult);
      success = true;
    } catch (e) {
      LogUtils.printLog(e.toString());
      LogUtils.logWith("Insert Failed:", e.toString());
    }
    return success;
  }

  Future<List<ShortenResult>> getAllShortenURLs() async {
    List<ShortenResult> results;
    try {
      results = await ShortenDBProvider.db.getAllShortenURLs();
    } catch (e) {
      LogUtils.printLog(e.toString());
      LogUtils.logWith("getAllShortenURLs Failed:", e.toString());
    }
    return results;
  }
}