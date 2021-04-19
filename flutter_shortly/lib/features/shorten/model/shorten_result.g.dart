// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorten_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortenResult _$ShortenResultFromJson(Map<String, dynamic> json) {
  return ShortenResult(
    id: json['id'] as int,
    code: json['code'] as String,
    short_link: json['short_link'] as String,
    full_short_link: json['full_short_link'] as String,
    short_link2: json['short_link2'] as String,
    full_short_link2: json['full_short_link2'] as String,
    short_link3: json['short_link3'] as String,
    full_short_link3: json['full_short_link3'] as String,
    share_link: json['share_link'] as String,
    full_share_link: json['full_share_link'] as String,
    original_link: json['original_link'] as String,
  );
}

Map<String, dynamic> _$ShortenResultToJson(ShortenResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'short_link': instance.short_link,
      'full_short_link': instance.full_short_link,
      'short_link2': instance.short_link2,
      'full_short_link2': instance.full_short_link2,
      'short_link3': instance.short_link3,
      'full_short_link3': instance.full_short_link3,
      'share_link': instance.share_link,
      'full_share_link': instance.full_share_link,
      'original_link': instance.original_link,
    };
