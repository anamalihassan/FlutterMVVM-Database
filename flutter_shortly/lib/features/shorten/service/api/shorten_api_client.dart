
import 'package:dio/dio.dart';
import 'package:flutter_shortly/features/shorten/model/shorten_api_response.dart';
import 'package:retrofit/retrofit.dart';

part 'shorten_api_client.g.dart';

@RestApi()
abstract class ShortenApiClient {

  factory ShortenApiClient(Dio dio, {String baseUrl}) = _ShortenApiClient;

  @GET("/shorten")
  Future<ShortenAPIResponse> shortenURL(@Query("url") String url);

}
