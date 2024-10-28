import 'package:expense_tracker/widget/expensis_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_bottom_expense_sheet.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> registeredExpenses = [
    Expense(
        title: "Flutter Course",
        amount: 19.92,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 41.03,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  //void addExpense()
  void addExpense(Expense exp) {
    setState(() {
      registeredExpenses.add(exp);
    });
  }

  void removeExpense(Expense exp) {
    var expenseIndex = registeredExpenses.indexOf(exp);
    setState(() {
      registeredExpenses.remove(exp);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense Deleted."),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            registeredExpenses.insert(expenseIndex, exp);
          });
        },
      ),
    ));
  }

  void _openAddExpenseoverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewBottomExpenseSheet(
              addExpense: addExpense,
            )
          );
  }

  @override
  Widget build(context) {
    Widget mainContent = const Center(
      child: Text("No expenses to show here, add some!"),
    );

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenseList: registeredExpenses,
        removeExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense Tracker",
          //style:Theme.of(context).textTheme.bodyLarge
        ),
        actions: [
          IconButton(
              onPressed: _openAddExpenseoverlay, 
              icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Column(
        children: [
          const Text("Chart"), 
          Expanded(child: mainContent)
        ],
      ),
    );
  }
}
