import 'package:expense_tracker/widget/expensis_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.92, 
      date: DateTime.now(),
      category: Category.work
      ),
     Expense(
      title: "Cinema",
      amount: 41.03, 
      date: DateTime.now(),
      category: Category.leisure
      ),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(
            child: ExpensesList(
              expenseList: _registeredExpenses
            ),
          )
        ],
      ),
    );
  }
}
