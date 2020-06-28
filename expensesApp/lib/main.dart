import 'dart:math';
import 'package:expensesApp/widgets/chart.dart';
import 'package:expensesApp/widgets/new_transaction.dart';
import 'package:expensesApp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        scaffoldBackgroundColor: Color.fromRGBO(47, 49, 64, 1),
        fontFamily: "Quicksand",
        primaryColor: Color.fromRGBO(47, 49, 64, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(id: "t1", title: "ayakkabı", amount: 300.25, date: DateTime.now()),
    // Transaction(id: "t1", title: "tshirt", amount: 20.12, date: DateTime.now()),
    // Transaction(id: "t1", title: "telefon", amount: 2500.45, date: DateTime.now())
  ];
  void _addNewTransaction(String title, double amount, DateTime _date) {
    final newTx = new Transaction(
        id: Random.secure().nextInt(99999).toString(),
        title: title,
        amount: amount,
        date: _date);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String _id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == _id);
    });  
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Chart(_userTransaction),
            TransactionList(_userTransaction,_deleteTransaction)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context)),
    );
  }
}
