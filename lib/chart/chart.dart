import 'package:expense_tracker/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
   Chart({super.key, required this.expense});
  List<Expense> expense;
  
 
  List<ExpenseCategory> get bars{
    return [
      ExpenseCategory.category(Category.food, expense),
      ExpenseCategory.category(Category.leisure, expense),
      ExpenseCategory.category(Category.travel, expense),
      ExpenseCategory.category(Category.work, expense)
    ];
  }
  double get maxExpenseAmount{
    double maxExpenseAmount = 0;
    for (final bar in bars) {
      if(bar.totalExpense>maxExpenseAmount){
        maxExpenseAmount = bar.totalExpense;
      }
    }
    return maxExpenseAmount;
  }


  @override
  Widget build(BuildContext context) {
    final darkMode = MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 9
      ),
      height: 185,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius:const BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.7),
            Theme.of(context).colorScheme.primary.withOpacity(0.2)
          ]
        )
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: bars.map((bar)
              => ChartBar(fill: bar.totalExpense/maxExpenseAmount)
              ).toList(),
            )
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: 
              bars.map((bucket)
              => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    CategoryIcons[bucket.category],
                    color: darkMode
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary
                  ),
                ),
               )
              ).toList(),
          )
        ],
      ),
    );
  }
}
