import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

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
          mainAxisAlignment: MainAxisAlignment.start,
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
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                        decoration: InputDecoration(label: Text('Title'))),
                    TextField(
                        decoration: InputDecoration(label: Text('Amount'))),
                    FlatButton(
                        textColor: Colors.purple,
                        onPressed: () {},
                        child: Text('Add The Transaction')),
                  ],
                ),
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
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Text(
                        '\$ ${i.amount}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          i.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
            }).toList())
          ],
        ));
  }
}
