// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ShortenApiClient implements ShortenApiClient {
  _ShortenApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ShortenAPIResponse> shortenURL(url) async {
    ArgumentError.checkNotNull(url, 'url');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/shorten',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ShortenAPIResponse.fromJson(_result.data);
    return value;
  }
}
