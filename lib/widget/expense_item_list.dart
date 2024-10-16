import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItemList extends StatelessWidget {
  const ExpenseItemList({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text((expense.amount).toString()),
                const SizedBox(
                  width: 150,
                ),
                Text((expense.date).toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
