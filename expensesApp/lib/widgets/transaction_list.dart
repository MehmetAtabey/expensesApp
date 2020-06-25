import 'package:expensesApp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black45),
                    ),
                    child: Text(
                      '₺ ' + transactions[index].amount.toStringAsFixed(2),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(transactions[index].title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    Text(
                      DateFormat().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ));
          },
          itemCount: transactions.length,
        ));
  }
}
