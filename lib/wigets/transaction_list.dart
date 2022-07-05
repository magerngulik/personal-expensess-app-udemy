import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transaction;
  TranscationList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: ((user, index) {
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
                    '\$ ${transaction[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      DateFormat.yMMMMd("en_US")
                          .format(transaction[index].date),
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
