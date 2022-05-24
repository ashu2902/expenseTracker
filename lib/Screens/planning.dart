import 'dart:ui';

import 'package:expense_tracker/widgets/favCategories.dart';
import 'package:expense_tracker/widgets/monthlySpend.dart';
import 'package:flutter/material.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planning"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: wd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: MonthlySpend(),
              ),
              const Padding(
                padding: EdgeInsets.all(28.0),
                child: const Text(
                  "Categories",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const CategoryList(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          const CategoryTile(),
          const CategoryTile(),
          const CategoryTile(),
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: wd,
        child: Card(
          color: const Color(0xff2C2C2E),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 18),
                  child: CategoryIcon(
                    size: 80,
                    color: Color(0xffEB6842),
                    iconPath: "assets/food_icon.png",
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Food",
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(
                              "assets/swiggyIcon.png",
                              height: 20,
                              width: 50,
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(
                              "assets/zomatoIcon.png",
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Image.asset(
                              "assets/mcdIcon.png",
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Text(
                  "₹ 1500",
                  style: TextStyle(fontSize: 18),
                ),
                const Icon(Icons.keyboard_arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
