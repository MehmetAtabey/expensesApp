import 'package:expensesApp/models/transaction.dart';
import 'package:expensesApp/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalsum = 0.0;

      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalsum += recentTransaction[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalsum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(
        0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Card(
          color: Color.fromRGBO(68, 73, 98, 1),
          elevation: 6,
          margin: EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                children: groupedTransactionValues.map((data) {
              return Expanded(
                child: ChartBar(
                    label: data['day'],
                    spendingAmount: data['amount'],
                    spendingPctOfTotal: maxSpending == 0.0
                        ? 0.0
                        : ((data['amount'] as double) / maxSpending)),
              );
            }).toList()),
          ),
        ),
      ),
    );
  }
}
