import 'package:flutter_shortly/features/shorten/model/shorten_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shorten_api_response.g.dart';

@JsonSerializable()
class ShortenAPIResponse {
  bool ok;
  int error_code;
  String error;
  ShortenResult result;


  ShortenAPIResponse({this.ok,this.error_code, this.error, this.result});

  factory ShortenAPIResponse.fromJson(Map<String, dynamic> json) => _$ShortenAPIResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShortenAPIResponseToJson(this);
}