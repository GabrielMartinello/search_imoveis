// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  name: json['nm_emp'] as String,
  addressType: json['tp_logr'] as String,
  addressName: json['nm_logr'] as String,
  city: json['mun'] as String,
  uf: json['uf'] as String,
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'nm_emp': instance.name,
  'tp_logr': instance.addressType,
  'nm_logr': instance.addressName,
  'mun': instance.city,
  'uf': instance.uf,
};
