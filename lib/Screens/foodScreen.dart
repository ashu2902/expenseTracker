import 'package:expense_tracker/widgets/monthlySpend.dart';
import 'package:flutter/material.dart';

class FoodCategoryScreen extends StatefulWidget {
  const FoodCategoryScreen({Key? key}) : super(key: key);

  @override
  State<FoodCategoryScreen> createState() => _FoodCategoryScreenState();
}

class _FoodCategoryScreenState extends State<FoodCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: MonthlySpend(),
          ),
          Row(
            children: [
              Card(
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
                    // ListView.builder(
                    //     itemCount: 1,
                    //     shrinkWrap: true,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return Container(
                    //         child: Row(
                    //           children: [],
                    //         ),
                    //       );
                    //     })
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
