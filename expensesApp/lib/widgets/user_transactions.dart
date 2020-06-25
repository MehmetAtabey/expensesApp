import 'dart:math';

import 'package:expensesApp/models/transaction.dart';
import 'package:expensesApp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(id: "t1", title: "ayakkabı", amount: 300.25, date: DateTime.now()),
    Transaction(id: "t1", title: "tshirt", amount: 20.12, date: DateTime.now()),
    Transaction(id: "t1", title: "telefon", amount: 2500.45, date: DateTime.now())
  ];
  void _addNewTransaction(String title, double amount) {
    final newTx = new Transaction(
        id: Random.secure().nextInt(99999).toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addNewTransaction), TransactionList(_userTransaction)],
    );
  }
}
