import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transaction;
  TranscationList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: transaction.map((i) {
      return Card(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  border: Border.all(color: Colors.white, width: 2)),
              child: Text(
                '\$ ${i.amount}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  i.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  DateFormat.yMMMMd("en_US").format(i.date),
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      );
    }).toList());
  }
}
