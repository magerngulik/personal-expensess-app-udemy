import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function addTx;
  NewTransaction(this.addTx);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                controller: titleController,
                decoration: InputDecoration(label: Text('Title'))),
            TextField(
                controller: amountController,
                decoration: InputDecoration(label: Text('Amount'))),
            FlatButton(
                textColor: Colors.purple,
                onPressed: () {
                  addTx(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text('Add The Transaction')),
          ],
        ),
      ),
    );
  }
}
