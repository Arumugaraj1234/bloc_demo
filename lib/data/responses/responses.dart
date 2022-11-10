import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "Code")
  int? status;
  @JsonKey(name: "Message")
  String? message;
}

@JsonSerializable()
class RequestOtpResponse extends BaseResponse {
  @JsonKey(name: "Name")
  String? name;

  RequestOtpResponse(this.name);

  // from json
  factory RequestOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestOtpResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$RequestOtpResponseToJson(this);
}
