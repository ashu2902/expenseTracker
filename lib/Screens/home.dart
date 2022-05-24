import 'package:expense_tracker/widgets/favCategories.dart';
import 'package:expense_tracker/widgets/header.dart';
import 'package:expense_tracker/widgets/rewards.dart';
import 'package:expense_tracker/widgets/totalSpentCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final wd = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/logo.png"),
          actions: [
            Image.asset('assets/notification_icon.png'),
            Image.asset('assets/profile_icon.png')
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderRow(),
              const TotalExpensesCard(),
              const FavCat(),
              const Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Rewards(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(
                  "assets/refer.png",
                  width: wd,
                ),
              )
            ],
          ),
        ));
  }
}
