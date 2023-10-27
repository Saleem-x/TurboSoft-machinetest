import 'package:json_annotation/json_annotation.dart';

part 'uset_base_model.g.dart';

@JsonSerializable()
class UsetBaseModel {
  @JsonKey(name: 'cusID')
  String? cusId;
  @JsonKey(name: 'cus_Name')
  dynamic cusName;
  @JsonKey(name: 'cus_MobileNumber')
  dynamic cusMobileNumber;
  @JsonKey(name: 'cus_addr')
  String? cusAddr;
  @JsonKey(name: 'cus_city')
  String? cusCity;
  @JsonKey(name: 'cus_state')
  String? cusState;
  @JsonKey(name: 'cus_country')
  String? cusCountry;
  @JsonKey(name: 'cus_pin')
  String? cusPin;
  @JsonKey(name: 'cus_email')
  String? cusEmail;
  @JsonKey(name: 'Title')
  String? title;
  @JsonKey(name: 'Descr')
  String? descr;
  @JsonKey(name: 'Status')
  String? status;
  @JsonKey(name: 'BranchId')
  dynamic branchId;
  @JsonKey(name: 'OrderSeq')
  dynamic orderSeq;

  UsetBaseModel({
    this.cusId,
    this.cusName,
    this.cusMobileNumber,
    this.cusAddr,
    this.cusCity,
    this.cusState,
    this.cusCountry,
    this.cusPin,
    this.cusEmail,
    this.title,
    this.descr,
    this.status,
    this.branchId,
    this.orderSeq,
  });

  factory UsetBaseModel.fromJson(Map<String, dynamic> json) {
    return _$UsetBaseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UsetBaseModelToJson(this);
}
