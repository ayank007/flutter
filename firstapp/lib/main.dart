import 'package:firstapp/addtransaction.dart';
import 'package:firstapp/transactionCard.dart';
import 'package:firstapp/transactionchart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Expences"),
        ),
        body: Column(
          children: <Widget>[
            TransactionChart(),
            AddTransaction(),
            TransactionCard(),
          ],
        ),
      ),
    );
  }
}
