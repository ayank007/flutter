import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function addingTransaction;
  final int transactionLength;

  AddTransaction(
      {required this.addingTransaction, required this.transactionLength});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDate = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);

  void submitTransaction() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredAmount <= 0 ||
        enteredTitle.isEmpty ||
        _selectedDate == null ||
        _selectedDate ==
            DateTime(DateTime.now().year, DateTime.now().month,
                DateTime.now().day + 1)) {
      return;
    }
    widget.addingTransaction(
      Transactions(
        id: widget.transactionLength + 1,
        bill: enteredAmount,
        title: enteredTitle,
        date: _selectedDate,
      ),
    );
    Navigator.of(context).pop();
  }

  void _pickADate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null ||
          value ==
              DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day + 1)) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter Bill Title'),
              style: TextStyle(color: Colors.white),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Bill Ammount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _selectedDate ==
                            DateTime(DateTime.now().year, DateTime.now().month,
                                DateTime.now().day + 1)
                        ? 'No Date Choosen'
                        : DateFormat.yMd().format(_selectedDate),
                  ),
                  TextButton(
                    onPressed: _pickADate,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => submitTransaction(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Save Transaction',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
