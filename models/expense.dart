import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
// need to use date format as day month year

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  basic,
  other,
  education,
  extra,
  credit,
}

const categoryIcons = {
  Category.basic: Icons.shopping_cart,
  Category.other: Icons.folder_shared_sharp,
  Category.education: Icons.collections_bookmark_sharp,
  Category.extra: Icons.next_week_sharp,
  Category.credit: Icons.currency_exchange
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.catgry,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allexp, this.catgry)
      : expenses = allexp
            .where((exp) => exp.category == catgry)
            .toList(); // if catgry matches then keep it in the list

  final Category catgry;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final exp in expenses) {
      sum += exp.amount;
    }

    return sum;
  }
}
