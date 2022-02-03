import 'package:firstapp/widgets/transactionchart.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/widgets/addtransaction.dart';
import 'package:firstapp/widgets/transactionCard.dart';
import '../models/transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transactions> _transactions = [];

  void addingTransaction(Transactions transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  void _startAddNewTransction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddTransaction(
              addingTransaction: addingTransaction,
              transactionLength: _transactions.length,
            ),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Transactions> get _recentTransction {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expense App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.green.shade300,
        accentColor: Colors.greenAccent.shade400,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Expences"),
          backgroundColor: Theme.of(context).primaryColorDark,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TransactionChart(
                recentTransactions: _recentTransction,
              ),
              TransactionCard(
                transactions: _transactions,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context1) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startAddNewTransction(context1),
          ),
        ),
      ),
    );
  }
}
