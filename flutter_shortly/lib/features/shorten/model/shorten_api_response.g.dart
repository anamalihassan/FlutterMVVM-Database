// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortenAPIResponse _$ShortenAPIResponseFromJson(Map<String, dynamic> json) {
  return ShortenAPIResponse(
    ok: json['ok'] as bool,
    error_code: json['error_code'] as int,
    error: json['error'] as String,
    result: json['result'] == null
        ? null
        : ShortenResult.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShortenAPIResponseToJson(ShortenAPIResponse instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'error_code': instance.error_code,
      'error': instance.error,
      'result': instance.result,
    };
