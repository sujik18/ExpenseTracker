import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';


class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});
  final void Function(Expense exp) onAddExpense;
  
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  /* Storing user input value in a variable by calling a function
  var _enteredDescription = '';
  
  void _saveDescription(String inputValue) {
    _enteredDescription = inputValue;
  }
  */
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.basic;

  void _datePicker() async {
    //async function used to wait for the future value
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    //change the date format to date month year
    
    final pickedDate = await showDatePicker(
        //future DateTime
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now); // this line only execute when value is returned from showDatePicker
    
    setState(() {
      _selectedDate = pickedDate;
    });
  }
  
 
  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  
  void _submitExpenseData(){  //trim() is used to remove the extra spaces
    final enteredAmount = double.tryParse(_amountController.text.trim());
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    
    if(_descriptionController.text.trim().isEmpty || _amountController.text.trim().isEmpty || _selectedDate == null || amountIsInvalid){
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: const Text('Invalid Input'),
        content: const Text('Please enter valid input'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('Okay'),
          )
        ],
      ));
      return;
    }
    widget.onAddExpense(
    Expense(
      title :  _descriptionController.text,
      amount : enteredAmount,
      date : _selectedDate!,
      category : _selectedCategory,
    ),
  );
  Navigator.pop(context);

  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,58,16,16,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: _descriptionController,
            maxLength: 20,
            style: Theme.of(context).textTheme.titleLarge,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.titleLarge,
                  controller: _amountController,
                  maxLength: 10,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: 'Rs ', 
                    prefixStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    style: Theme.of(context).textTheme.titleSmall,
                    _selectedDate == null
                        ? 'Select Date'
                        : formatter.format(
                            _selectedDate!), /*! is used to tell the compiler that the value is not null*/
                  ),
                  IconButton(
                    onPressed: _datePicker,
                    icon: const Icon(Icons.calendar_today),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              DropdownButton(
                
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name.toUpperCase(),
                           style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if(value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
