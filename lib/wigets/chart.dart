import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transcation> recentTransaction;

  Chart(this.recentTransaction);
  List<Map<String, Object>> get groupedTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum;

      for (var i; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      print(DateFormat.E(weekDay));
      print(totalSum);

      return {'day': DateFormat.E(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(),
    );
  }
}
