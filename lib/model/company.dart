import 'package:json_annotation/json_annotation.dart';
import 'company.dart';
part 'company.g.dart';

@JsonSerializable()
class Company {
  String name;
  String addressType;
  String addressName;
  String city;
  String uf;

  Company({
    required this.name,
    required this.addressType,
    required this.addressName,
    required this.city,
    required this.uf,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
