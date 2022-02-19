import 'package:firstapp/widgets/transactionchart.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/widgets/addtransaction.dart';
import 'package:firstapp/widgets/transactionCard.dart';
import 'package:flutter/services.dart';
import '../models/transactions.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          primarySwatch: Colors.green,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 50,
              color: Colors.green.shade200,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _deleteTransaction(int transaction) {
    setState(() {
      _transactions.removeWhere((element) => element.id == transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Expences",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
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
              deleteATransaction: _deleteTransaction,
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
    );
  }
}
