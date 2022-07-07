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
      child: transaction.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Transaction added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: ((user, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
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
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                              DateFormat.yMMMMd("en_US")
                                  .format(transaction[index].date),
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey)),
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
