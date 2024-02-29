import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String username;

  UserModel({
    required this.id,
    required this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    json.forEach((key, value) {
      if (value == null) {
        print('$key is null');
      }
    });

    return UserModel(
      id: json['id'],
      username: json['username'],
    );
  }
}
