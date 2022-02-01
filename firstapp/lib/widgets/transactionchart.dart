import 'package:flutter/material.dart';

class TransactionChart extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade50,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              offset: Offset(1, 3), //(x,y)
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          'data',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
