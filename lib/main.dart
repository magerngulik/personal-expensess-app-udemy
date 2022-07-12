import 'package:flutter/material.dart';
import 'package:personal_expenses_app/wigets/chart.dart';
import './wigets/new_transactions.dart';
import './wigets/transaction_list.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        errorColor: Colors.red[200],
        accentColor: Colors.amber,
        fontFamily: 'Quicksans',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ));

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transcation> _userTransaction = [
    // Transcation(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 0.05,
    //   date: DateTime.now(),
    // ),
    // Transcation(
    //   id: 't2',
    //   title: 'New Chlote',
    //   amount: 2,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transcation> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  addNewTransaction(String title, double amount, DateTime date) {
    final newTx = Transcation(
        amount: amount,
        title: title,
        date: date,
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _delTransactions(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  //karna ingin menampilkan di modal
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
            child: NewTransaction(addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
        ),
        actions: [
          IconButton(
              onPressed: () => startAddNewTransaction(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransaction),
            TranscationList(_userTransaction, _delTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          }),
    );
  }
}
