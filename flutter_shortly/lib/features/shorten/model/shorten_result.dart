import 'package:json_annotation/json_annotation.dart';

part 'shorten_result.g.dart';

@JsonSerializable()
class ShortenResult {
  int id;
  String code;
  String short_link;
  String full_short_link;
  String short_link2;
  String full_short_link2;
  String short_link3;
  String full_short_link3;
  String share_link;
  String full_share_link;
  String original_link;


  ShortenResult({this.id, this.code, this.short_link, this.full_short_link, this.short_link2, this.full_short_link2, this.short_link3,
    this.full_short_link3, this.share_link, this.full_share_link, this.original_link});

  factory ShortenResult.fromJson(Map<String, dynamic> json) => _$ShortenResultFromJson(json);

  Map<String, dynamic> toJson() => _$ShortenResultToJson(this);
}

ShortenResultDefualtModel(){
  return ShortenResult();
}