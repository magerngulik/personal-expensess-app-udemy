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
              children: transactions.map((tx) {
                return Card(
                  child: Text(tx.title),
                );
              }).toList(),
            )
          ],
        ));
  }
}
