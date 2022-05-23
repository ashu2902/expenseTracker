import 'dart:developer';
import 'dart:ui';

import 'package:expense_tracker/widgets/totalSpentSlider.dart';
import 'package:flutter/material.dart';

class TotalExpensesCard extends StatefulWidget {
  const TotalExpensesCard({Key? key}) : super(key: key);

  @override
  State<TotalExpensesCard> createState() => _TotalExpensesCardState();
}

class _TotalExpensesCardState extends State<TotalExpensesCard> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.hardEdge,
        color: Colors.white,
        child: SizedBox(
          width: wd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Total spent this month",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              TotalSpentSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
