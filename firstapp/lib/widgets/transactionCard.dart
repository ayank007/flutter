import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionCard extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteATransaction;
  TransactionCard({
    required this.transactions,
    required this.deleteATransaction,
  });

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text('There\'s no Transaction to show'),
              Container(
                padding: EdgeInsets.all(15),
                // height: 200,
                child: Image.asset(
                  'Images/ayan.jpg',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : Column(
            children: transactions.map((transaction) {
              return Card(
                margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              '\$${transaction.bill.toStringAsFixed(2)}/-',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                transaction.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                DateFormat.yMMMd().format(transaction.date),
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 13, 255, 235),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 7,
                        ),
                        child: IconButton(
                          onPressed: () => deleteATransaction(transaction.id),
                          icon: Icon(Icons.delete_rounded),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
  }
}
