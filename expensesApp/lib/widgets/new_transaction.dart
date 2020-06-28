import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime dateExpense = DateTime.now();

  void _sumbitData() {
    final enteredtitle = titleController.text;
    final enteredamount = amountController.text;
    if (enteredtitle.isEmpty || double.parse(enteredamount) <= 0) return;
    widget.addTx(titleController.text, double.parse(amountController.text),dateExpense);
//    Navigator.of(context).pop();
  }

  void _prensentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) => {
              if (value != null)
                {
                  setState(() {
                    dateExpense = value;
                  })
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
                onSubmitted: (_) => _sumbitData()),
            TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _sumbitData()),
            Container(
              height: 70,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                Text(
                  dateExpense != null
                      ? DateFormat.yMd().format(dateExpense)
                      : 'No Date Chosen!',
                  style: TextStyle(color: Colors.black),
                ),
                FlatButton(
                    onPressed: _prensentDatePicker,
                    child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)))
              ]),
            ),
            RaisedButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {
                  _sumbitData();
                },
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
