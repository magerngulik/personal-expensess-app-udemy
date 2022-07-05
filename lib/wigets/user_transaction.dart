import 'package:flutter/material.dart';
import './new_transactions.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transcation> _userTransaction = [
    Transcation(
        id: 't1', title: 'New Shoes', amount: 69.9, date: DateTime.now()),
    Transcation(
        id: 't2', title: 'Wekly Grosery', amount: 16.6, date: DateTime.now()),
  ];

  addNewTransaction(String title, double amount) {
    final newTx = Transcation(
        amount: amount,
        title: title,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TranscationList(
          _userTransaction,
        )
      ],
    );
  }
}
