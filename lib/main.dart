import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ));

class MyHomePage extends StatelessWidget {
  final List<Transcation> transactions = [
    Transcation(
        id: 't1', title: 'New Shoes', amount: 69.9, date: DateTime.now()),
    Transcation(
        id: 't2', title: 'Wekly Grosery', amount: 16.6, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Column(
                children: transactions.map((i) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Text(i.amount.toString()),
                    ),
                    Column(
                      children: [
                        Text(i.title),
                        Text(i.date.toString()),
                      ],
                    )
                  ],
                ),
              );
            }).toList())
          ],
        ));
  }
}
