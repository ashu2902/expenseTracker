import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({required this.recentTransactions, Key? key})
      : super(key: key);
  final List<Expense> recentTransactions;
  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color(0xff2C2C2E),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/recentTransaction.png"),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "recent transactions",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            ListView.builder(
                itemCount: widget.recentTransactions.length > 4
                    ? 4
                    : widget.recentTransactions.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/swiggyIcon.png"),
                          Column(
                            children: [
                              Text(widget.recentTransactions[index].merchant),
                              Text(widget.recentTransactions[index].date)
                            ],
                          ),
                          Text(
                              "₹${widget.recentTransactions[index].amount.toString()}")
                        ],
                      ),
                      Divider()
                    ]),
                  );
                })
          ],
        ),
      ),
    );
  }
}
