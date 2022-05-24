import 'package:expense_tracker/home.dart';
import 'package:expense_tracker/planning.dart';
import 'package:expense_tracker/themes/themes.dart';
import 'package:expense_tracker/widgets/favCategories.dart';
import 'package:expense_tracker/widgets/header.dart';
import 'package:expense_tracker/widgets/totalSpentCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zerobalance Flutter Assignment',
      theme: ThemeClass.darkTheme,
      home: const MyHomePage(title: 'Zerobalance Flutter Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, left: 20, right: 20),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              shape: BoxShape.rectangle),
          child: BottomNavigationBar(
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              enableFeedback: true,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: index,
              selectedItemColor: Colors.black12,
              unselectedItemColor: Colors.black12,
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "",
                    icon: index == 0
                        ? Image.asset(
                            "assets/home_icon.png",
                            color: Colors.black,
                          )
                        : Image.asset(
                            "assets/home_icon.png",
                            color: Colors.black12,
                          )),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "",
                    icon: index == 1
                        ? Image.asset(
                            "assets/icon2.png",
                            color: Colors.black,
                          )
                        : Image.asset("assets/icon2.png")),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "",
                    icon: index == 2
                        ? Image.asset("assets/icon3.png",
                            color: const Color(0xff1C1C1E))
                        : Image.asset("assets/icon3.png")),
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    label: "",
                    icon: index == 3
                        ? Image.asset(
                            "assets/icon4.png",
                            color: Colors.black,
                          )
                        : Image.asset("assets/icon4.png")),
              ]),
        ),
      ),
      body: screens[index],
    );

    // Scaffold(
    //     appBar: AppBar(
    //       title: Image.asset("assets/logo.png"),
    //       actions: [
    //         Image.asset('assets/notification_icon.png'),
    //         Image.asset('assets/profile_icon.png')
    //       ],
    //     ),
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: const [HeaderRow(), TotalExpensesCard(), FavCat()],
    //       ),
    //     ));
  }
}

List screens = const <Widget>[
  HomePage(),
  HomePage(),
  PlanningPage(),
  HomePage(),
];
