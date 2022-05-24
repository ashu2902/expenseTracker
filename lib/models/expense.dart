import 'package:flutter/material.dart';

class Expense {
  Expense(
      {required this.amount,
      required this.category,
      required this.date,
      required this.merchant,
      required this.paidVia});
  double amount;
  String category;
  String date;
  String merchant;
  String paidVia;
}
