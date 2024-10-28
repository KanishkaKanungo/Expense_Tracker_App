import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class ExpenseItemList extends StatelessWidget {
  const ExpenseItemList({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 9
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('\$${(expense.amount).toString()}'),
                const Spacer(),
                 Row(
                  children: [
                     Icon(CategoryIcons[expense.category]),
                    const SizedBox(width: 5,),
                    Text(expense.formattedDate),
                  ], 
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
