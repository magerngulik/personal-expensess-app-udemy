import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  Function addTx;
  NewTransaction(this.addTx);
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      print('error di sini loh');
      return;
    }
    addTx(enteredTitle, enteredAmount);
  }

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
              decoration: InputDecoration(label: Text('Title')),
              onSubmitted: (_) => submitData,
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(label: Text('Amount')),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                textColor: Colors.purple,
                onPressed: submitData,
                child: Text('Add The Transaction')),
          ],
        ),
      ),
    );
  }
}
