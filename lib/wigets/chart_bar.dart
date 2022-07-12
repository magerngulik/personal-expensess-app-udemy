import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String title;
  double spendingAmount;
  double spendingPCtOfTotal;

  ChartBar(this.title, this.spendingAmount, this.spendingPCtOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: spendingAmount,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10))),
              )
            ]),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.15,
              child: Text(title[0].toUpperCase())),
        ],
      );
    }));
  }
}
