import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expense_item_list.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenseList});

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) 
      => ExpenseItemList(
        expense: expenseList[index]
      ),
    );
  }
}
