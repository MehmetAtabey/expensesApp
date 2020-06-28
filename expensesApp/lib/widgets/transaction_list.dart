import 'package:expensesApp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: transactions.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("No Data",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(width: 100, height: 30),
                    Container(
                        height: 200,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ))
                  ])
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 5, bottom: 5),
                      color: Color.fromRGBO(68, 73, 98, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black45),
                              ),
                              child: Text(
                                '₺ ' +
                                    transactions[index]
                                        .amount
                                        .toStringAsFixed(2),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(transactions[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              Text(
                                DateFormat().format(transactions[index].date),
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.delete, color: Colors.white),
                                  onPressed: () => deleteTransaction(
                                      transactions[index].id)))
                        ],
                      ));
                },
                itemCount: transactions.length,
              ));
  }
}
