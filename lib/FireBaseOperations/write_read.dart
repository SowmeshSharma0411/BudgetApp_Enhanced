import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class transaction {
  String id;
  final String type;
  final int amt;
  final DateTime date;

  transaction({
    this.id = '',
    required this.type,
    required this.amt,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'Type': type,
        'Amount': amt,
        'Date': date,
      };
  static transaction fromJson(Map<String, dynamic> json) => transaction(
      id: json['id'],
      type: json['Type'],
      amt: json['Amount'],
      date: json['Date'] == null ? DateTime.now() : json['Date'].toDate());
}
