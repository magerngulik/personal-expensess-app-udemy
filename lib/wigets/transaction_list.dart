import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transcation> transaction;
  final Function deleteTx;
  TranscationList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    final curScalerFactor = MediaQuery.of(context).textScaleFactor;

    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
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
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: ((user, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('\$${transaction[index].amount}')),
                    ),
                  ),
                  title: Text(transaction[index].title,
                      style: Theme.of(context).textTheme.titleMedium),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transaction[index].date)),
                  trailing: IconButton(
                    iconSize: 30,
                    icon:
                        Icon(Icons.delete, color: Theme.of(context).errorColor),
                    onPressed: () {
                      deleteTx(transaction[index].id);
                    },
                  ),
                ),
              );
            }),
          );
  }
}
