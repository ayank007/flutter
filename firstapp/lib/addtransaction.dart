import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
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
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter Bill Ammount'),
            ),
            FlatButton(
                onPressed: null,
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
