import 'package:json_annotation/json_annotation.dart';
import 'company.dart';
part 'company.g.dart';

@JsonSerializable()
class Company {

  int? id;
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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'addressType': addressType,
      'addressName': addressName,
      'city': city,
      'uf': uf,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'],
      addressType: map['addressType'],
      addressName: map['addressName'],
      city: map['city'],
      uf: map['uf'],
    );
  }
}
