import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

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
      title: 'Groceries',
      amount: 100.0,
      date: DateTime.now(),
      category: Category.basic,
    ),
    Expense(
      title: 'Books',
      amount: 50.0,
      date: DateTime.now(),
      category: Category.education,
    ),
    Expense(
      title: 'Laptop',
      amount: 1500.0,
      date: DateTime.now(),
      category: Category.extra,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      //opens overlay
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense exp) {
    setState(() {
      //inside set state so as to ui get updated
      _registeredExpenses.add(exp);
    });
  }

  void _removeExpense(Expense id) {
    setState(() {
      _registeredExpenses.remove(id);
    });
    // undo operation
    ScaffoldMessenger.of(context).clearSnackBars(); //removing earlier snackbars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registeredExpenses.add(id);
            });
          },
        ),
      ),
    );
  }

  void _toggleTheme() {
    /*setState(() {
      currentThemeMode = currentThemeMode.toString()== ThemeMode.light.toString()
          ? ThemeMode.dark
          : ThemeMode.light;
      print(currentThemeMode);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expenses added yet!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses Tracker'),
        actions: [
          IconButton(
            icon: Icon(Theme.of(context).brightness == Brightness.light
                ? Icons.dark_mode
                : Icons.light_mode),
            onPressed: _toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseOverlay,
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(children: [
              Expanded(child: Chart(expenses: _registeredExpenses)),
              Expanded(child: mainContent),
            ]),
    );
  }
}
