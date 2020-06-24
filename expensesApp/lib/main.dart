import 'package:intl/intl.dart';
import 'package:expensesApp/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", title: "ayakkabı", amount: 300.25, date: DateTime.now()),
    Transaction(id: "t1", title: "tshirt", amount: 20.12, date: DateTime.now()),
    Transaction(
        id: "t1", title: "telefon", amount: 2500.45, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 100,
              child: Card(child: Text("CHART!!"), elevation: 10)),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: "Title")),
                  TextField(decoration: InputDecoration(labelText: "Amount")),
                  FlatButton(onPressed: () {}, child: Text("Add Transaction"))
                ],
              ),
            ),
          ),
          Column(
              children: transactions.map((tx) {
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
                      '₺ ' + tx.amount.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(tx.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    Text(
                      DateFormat().format(tx.date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ));
          }).toList())
        ],
      ),
    );
  }
}
