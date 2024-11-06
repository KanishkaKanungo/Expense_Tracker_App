import 'dart:ffi';

import 'package:expense_tracker/models/expense.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class NewBottomExpenseSheet extends StatefulWidget {
  NewBottomExpenseSheet({super.key, required this.addExpense});

  void Function(Expense expense) addExpense;

  @override
  State<NewBottomExpenseSheet> createState() {
    return _NewBottomExpenseSheetState();
  }
}

class _NewBottomExpenseSheetState extends State<NewBottomExpenseSheet> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _pickingDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpense() {
    final selectedAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = selectedAmount == null || selectedAmount <= 0;
      if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    "Please make sure valid title, amount and date was entered!"
                  ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text(
                        "Okay"
                      )
                    )
                ],
              )
            );
        return;
      }
      widget.addExpense(Expense(
        title: _titleController.text,
        amount: selectedAmount, 
        date: _selectedDate!, 
        category: _selectedCategory
      )); 
      Navigator.pop(context);
    }

    @override
    void dispose() {
      _titleController.dispose();
      _amountController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
       return LayoutBuilder(builder: (context,constraint){
        final width = constraint.maxWidth;
        print(width);
        print(constraint.minWidth);
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
           child: SingleChildScrollView(
             child: Padding(
               padding:  EdgeInsets.fromLTRB(20, 16, 20, keyboardSpace+20),
               child: Column(
                 //crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  if(width>=600)
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                          label: Text(
                           'Title',
                          style: TextStyle(
                             fontWeight: FontWeight.normal,
                             fontSize: 15
                           )
                         )
                        ),
                       ),
                      ),
                      const SizedBox(
                    width: 30
                    ),
                      Expanded(
                         child: TextField(
                           controller: _amountController,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               prefixText: '\$ ',
                                label: Text(
                                 "Amount",
                                 style:  TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15
                                 )
                               )
                             ),
                         ),
                      ),
                 ],
                )
                  else 
                   TextField(
                     controller: _titleController,
                     maxLength: 50,
                     //keyboardType: TextInputType.numberWithOptions(),
                     decoration: const InputDecoration(
                       label: Text(
                         'Title',
                         style: TextStyle(
                           fontWeight: FontWeight.normal,
                           fontSize: 15
                         )
                     )
                    ),
                   ),
                   if(width>=600)
                    Row(
                      children: [
                        DropdownButton(
                           value: _selectedCategory,
                           items: Category.values
                               .map((category) => DropdownMenuItem(
                                   value: category,
                                   child: Text(category.name.toUpperCase(),
                                   style: const TextStyle(
                                     fontWeight: FontWeight.normal,
                                     fontSize: 15
                                   ),
                                 )
                               )
                             ).toList(),
                           onChanged: (value) {
                             if (value == null) {
                               return;
                             }
                             setState(() {
                               _selectedCategory = value;
                             });
                           }
                          ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(_selectedDate == null
                                ? 'No Date Selected'
                                : formatter.format(_selectedDate!)),
                            IconButton(
                                onPressed: _pickingDate,
                                icon: const Icon(Icons.calendar_month))
                          ],
                        ),
                      ],
                    )
                  else
                   Row(
                     children: [
                       Expanded(
                         child: TextField(
                           controller: _amountController,
                           keyboardType: TextInputType.number,
                           decoration: const InputDecoration(
                               prefixText: '\$ ',
                                label: Text(
                                 "Amount",
                                 style:  TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15
                                 )
                               )
                             ),
                         ),
                       ),
                       const SizedBox(
                         width: 16,
                       ),
                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text(_selectedDate == null
                                 ? 'No Date Selected'
                                 : formatter.format(_selectedDate!)),
                             IconButton(
                                 onPressed: _pickingDate,
                                 icon: const Icon(Icons.calendar_month))
                           ],
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                   if(width>=600)
                    Row(
                      children: [
                        TextButton(
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           child: const Text("Cancel")),
                       ElevatedButton(
                           onPressed: _submitExpense,
                           child: const Text("Save Expense")),
                      ],
                    )
                  else
                   Row(
                     children: [
                       DropdownButton(
                           value: _selectedCategory,
                           items: Category.values
                               .map((category) => DropdownMenuItem(
                                   value: category,
                                   child: Text(category.name.toUpperCase(),
                                   style: const TextStyle(
                                     fontWeight: FontWeight.normal,
                                     fontSize: 15
                                   ),
                                 )
                               )
                             ).toList(),
                           onChanged: (value) {
                             if (value == null) {
                               return;
                             }
                             setState(() {
                               _selectedCategory = value;
                             });
                           }),
                       const Spacer(),
                       TextButton(
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           child: const Text("Cancel")),
                       ElevatedButton(
                           onPressed: _submitExpense,
                           child: const Text("Save Expense")),
                     ],
                   )
                 ],
               ),
             ),
           ),
         );
       }
      );
         
  }
}
