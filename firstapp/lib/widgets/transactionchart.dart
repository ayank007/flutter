import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionChart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  TransactionChart({required this.recentTransactions});

  List<Map<String, Object>> get dayTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].bill;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: dayTransactions.map((data) {
              // return Text('${data['day']} : ${data['amount']}');
              return Column(
                children: [
                  Text('\$${data['amount']}'),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 20,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.white,
                          Colors.blue.shade200,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.4, 0.5],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                  ),
                  Text(
                    '${data['day']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
