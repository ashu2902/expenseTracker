import 'package:flutter/material.dart';

class MonthlySpend extends StatefulWidget {
  const MonthlySpend({Key? key}) : super(key: key);

  @override
  State<MonthlySpend> createState() => MonthlySpendState();
}

class MonthlySpendState extends State<MonthlySpend> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    var ht = MediaQuery.of(context).size.height;
    return Card(
      color: Color(0xff2C2C2E),
      child: Container(
        height: 360,
        width: 340,
      ),
    );
  }
}
