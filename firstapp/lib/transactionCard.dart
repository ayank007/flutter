import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transactions.dart';

class TransactionCard extends StatelessWidget {
  final List<Transactions> transactions = [
    Transactions(
      id: 1,
      bill: 75.4,
      title: "Dinner",
      date: DateTime.now(),
    ),
    Transactions(
      id: 2,
      bill: 300,
      title: 'Chicken Popcorn',
      date: DateTime.utc(2022, 1, 30),
    )
  ];

  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple.shade700,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '\$${transaction.bill}/-',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
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
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
