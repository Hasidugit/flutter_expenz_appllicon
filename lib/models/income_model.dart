// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

enum IncomeCategory { freelance, salary, passive, sales }

final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "asstes/images/freelance.png",
  IncomeCategory.salary: "asstes/images/salary.png",
  IncomeCategory.passive: "asstes/images/expense.png",
  IncomeCategory.sales: "asstes/images/bag.png",
};

final Map<IncomeCategory, Color> incomeCategoryColor = {
  IncomeCategory.freelance: const Color.fromARGB(255, 30, 15, 61),
  IncomeCategory.passive: const Color.fromARGB(255, 143, 176, 12),
  IncomeCategory.salary: const Color.fromARGB(255, 187, 10, 54),
  IncomeCategory.sales: const Color.fromARGB(255, 5, 75, 30),
};

class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;
  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  // Create an Expense object from a JSON object
  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      category: IncomeCategory.values[json['category']],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }
}
