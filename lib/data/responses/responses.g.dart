// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['Code'] as int?
  ..message = json['Message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'Code': instance.status,
      'Message': instance.message,
    };

RequestOtpResponse _$RequestOtpResponseFromJson(Map<String, dynamic> json) =>
    RequestOtpResponse(
      json['Name'] as String?,
    )
      ..status = json['Code'] as int?
      ..message = json['Message'] as String?;

Map<String, dynamic> _$RequestOtpResponseToJson(RequestOtpResponse instance) =>
    <String, dynamic>{
      'Code': instance.status,
      'Message': instance.message,
      'Name': instance.name,
    };
