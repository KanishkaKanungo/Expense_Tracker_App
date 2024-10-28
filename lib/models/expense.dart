import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, travel, work, leisure }

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate => formatter.format(date);
}

class ExpenseCategory {
  final List<Expense> chartList;
  final Category category;
  ExpenseCategory.category(this.category, List<Expense> allCategories)
      : chartList =
            allCategories.where((expense) => expense.category == category).toList();
    double get totalSum{
      double sum = 0;

      for(final expense in chartList){
        sum =  sum + expense.amount;
      }
      return sum;
    }
}
