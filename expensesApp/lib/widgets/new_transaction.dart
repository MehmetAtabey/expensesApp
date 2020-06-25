import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  void sumbitData() {
    final enteredtitle = titleController.text;
    final enteredamount = amountController.text;
    if (enteredtitle.isEmpty || double.parse(enteredamount) <= 0) return;
    addTx(titleController.text, double.parse(amountController.text));
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
                onSubmitted: (_) => sumbitData()),
            TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => sumbitData()),
            FlatButton(
                onPressed: () {
                  sumbitData();
                },
                child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
