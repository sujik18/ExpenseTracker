import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense e) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
        },
        key: ValueKey(expenses[index].id),
        background: Card(
          color: Theme.of(context).colorScheme.error.withOpacity(0.6),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
        ),
        //margin: EdgeInsets.symmetric(horizontal: Theme.of(context).cardTheme.margin!.horizontal,),
        ),
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
