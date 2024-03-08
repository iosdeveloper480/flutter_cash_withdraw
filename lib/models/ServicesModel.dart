import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ServicesModel {
  final String id;
  final String name;
  final String image;

  ServicesModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    try {
      return ServicesModel(
        id: json['id'],
        name: json['name'],
        image: json['details'],
      );
    } catch (e, s) {
      print('ServicesModel JSON ${s.toString()}');
      throw FormatException(e.toString());
    }
  }
}
