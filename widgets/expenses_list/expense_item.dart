import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      //making the border at end circular
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500), //copyWith for applying individual stack 
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Rs ${expense.amount.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleSmall,
                ), //10.35554 => 10.35 for $ => as \$
                const Spacer(), //takes max space b/w two elements
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                      color: Theme.of(context).colorScheme.secondary,
                    ), //bcs enum value is itself is index
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                        expense
                            .formattedDate, // no parathesis (), bcs it is a getter instead of a function
                        style: Theme.of(context).textTheme.titleSmall),
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
