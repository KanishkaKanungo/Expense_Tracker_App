import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expense_item_list.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
   ExpensesList({super.key, required this.expenseList,required this.removeExpense });

  final List<Expense> expenseList;
  void Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (context, index) 
      => Dismissible(
        key: ValueKey(expenseList[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction) => removeExpense(
          expenseList[index]
        ),
        child: ExpenseItemList(
          expense: expenseList[index]
        ),
      ),
    );
  }
}
