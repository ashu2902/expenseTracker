import 'package:flutter/material.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({Key? key}) : super(key: key);

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
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
