import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TransactionModel {
  final String id;
  final String name;
  final String image;
  final String date;
  final String currentCurrency;
  final String currentAmount;
  final String otherCurrency;
  final String otherAmount;

  TransactionModel({
    required this.id,
    required this.name,
    required this.image,
    required this.date,
    required this.currentCurrency,
    required this.currentAmount,
    required this.otherCurrency,
    required this.otherAmount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    try {
      return TransactionModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        date: json['date'],
        currentCurrency: json['current_currency'],
        currentAmount: json['current_amount'],
        otherCurrency: json['other_currency'],
        otherAmount: json['other_amount'],
      );
    } catch (e, s) {
      print('ServicesModel JSON ${s.toString()}');
      throw FormatException(e.toString());
    }
  }
}
