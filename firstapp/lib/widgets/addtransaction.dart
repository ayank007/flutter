import 'package:flutter/material.dart';
import '../models/transactions.dart';

class AddTransaction extends StatefulWidget {
  final Function addingTransaction;
  final int transactionLength;

  AddTransaction(
      {required this.addingTransaction, required this.transactionLength});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addingTransaction(
      Transactions(
        id: widget.transactionLength + 1,
        bill: enteredAmount,
        title: enteredTitle,
        date: DateTime.now(),
      ),
    );
    Navigator.of(context).pop();
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
              style: TextStyle(color: Colors.purple),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Bill Ammount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
                onPressed: () => submitTransaction(),
                child: Text(
                  'Save Transaction',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
