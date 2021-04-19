import 'package:flutter_shortly/commons/config/locator.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_api_response.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_result.dart';
import 'package:flutter_shortly/features/shorten/service/database_service.dart';
import 'package:flutter_shortly/features/shorten/service/shorten_service.dart';
import 'package:flutter_shortly/features/shorten/view/shorten_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

class MockDatabaseService extends DatabaseService {
  List<ShortenResult> _shortenURLList = [];

  @override
  Future<bool> insertShortenURL(
      ShortenResult shortenResult) async {
    _shortenURLList.add(shortenResult);
    return true;
  }

  @override
  Future<List<ShortenResult>> getAllShortenURLs() async {
    return _shortenURLList;
  }
}

class MockShortenService extends ShortenService {
  @override
  Future<ShortenAPIResponse> shortenURL(String url) async {
    return ShortenAPIResponse(ok: true, result: mockShortenResult(url));
  }
}

ShortenResult mockShortenResult(String url) {
  return ShortenResult(
      id: 1,
      code: "hsuHIK",
      short_link: "shrtco.de/hsuHIK",
      full_short_link: "https://shrtco.de/hsuHIK",
      short_link2: "9qr.de/hsuHIK",
      full_short_link2: "https://9qr.de/hsuHIK",
      short_link3: "shiny.link/hsuHIK",
      full_short_link3: "https://shiny.link/hsuHIK",
      share_link: "shrtco.de/share/hsuHIK",
      full_share_link: "https://shrtco.de/share/hsuHIK",
      original_link: url);
}

void main() {
  setupLocator();
  var shortenViewModel = locator<ShortenViewModel>();
  shortenViewModel.databaseService = MockDatabaseService();
  shortenViewModel.shortenService = MockShortenService();

  group('Shorten URL Tests', () {
    test('when user shortens a URL, shortenURLList should increment by 1',
        () async {
      await shortenViewModel.callShortenURLAPI("google.com");
      expect(shortenViewModel.shortenURLList.length, 1);
      expect(shortenViewModel.shortenURLList[0].original_link, "google.com");

      await shortenViewModel.callShortenURLAPI("yahoo.com");
      expect(shortenViewModel.shortenURLList.length, 2);
      expect(shortenViewModel.shortenURLList[1].original_link, "yahoo.com");
    });
  });
}
