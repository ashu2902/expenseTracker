import 'dart:ui';

import 'package:expense_tracker/Screens/foodScreen.dart';
import 'package:expense_tracker/functions.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/categoryTile.dart';
import 'package:expense_tracker/widgets/favCategories.dart';
import 'package:expense_tracker/widgets/monthlySpend.dart';
import 'package:expense_tracker/widgets/recentTransactions.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  void initState() {
    super.initState();
    setData();
  }

  List<Expense>? data;
  List<Expense> foodList = [];
  List<Expense> shoppingList = [];
  List<Expense> entertainmentList = [];

  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    print("Useful Data $data");
    print("Food List idhar hai $foodList");
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
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              foodList.isEmpty
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => FoodCategoryScreen())));
                      },
                      child: CategoryTile(
                          category: "Food",
                          iconPath: "assets/food_icon.png",
                          price: foodList.last.amount.toString()),
                    ),
              shoppingList.isEmpty
                  ? Container()
                  : CategoryTile(
                      category: "Shopping",
                      iconPath: "assets/shopping_icon.png",
                      price: shoppingList.last.amount.toString()),
              entertainmentList.isEmpty
                  ? Container()
                  : CategoryTile(
                      category: "Entertainment",
                      iconPath: "assets/entertainment_icon.png",
                      price: entertainmentList.last.amount.toString()),
              RecentTransactions()
            ],
          ),
        ),
      ),
    );
  }

  setData() async {
    readFromStorage("expense").then((value) {
      setState(() {
        data = value;
      });
      addToLists(value);
      print("Ye hai value  $value");
    });
  }

  addToLists(List<Expense> data) {
    // for (var i = 0; i < data.length; i++) {}

    for (var element in data) {
      if (element.category == "Food") {
        print("======================  ${element.category}");
        foodList.add(element);
        print("FOOOD LISTTTT----------  ${foodList[0].category}");
      }
      if (element.category == "Entertainment") {
        entertainmentList.add(element);
      }
      if (element.category == "Shopping") {
        shoppingList.add(element);
      }
    }
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({required this.data, Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
  final List<Expense> data;
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return widget.data == null
        ? CircularProgressIndicator()
        : ListView.builder(
            itemCount: widget.data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CategoryTile(
                  category: widget.data[index].category,
                  iconPath: "assets/swiggyIcon.png",
                  price: widget.data[index].amount.toString());
            });
  }
}
