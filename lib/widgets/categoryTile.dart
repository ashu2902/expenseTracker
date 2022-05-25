import 'package:expense_tracker/widgets/favCategories.dart';
import 'package:flutter/material.dart';


class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {required this.category,
      required this.iconPath,
      required this.price,
      Key? key})
      : super(key: key);

  final String iconPath;
  final String price;
  final String category;
  
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
                Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 18),
                  child: CategoryIcon(
                    size: 80,
                    color: iconPath == "assets/entertainment_icon.png"
                        ? Color(0xff77ADD9)
                        : iconPath == "assets/shopping_icon.png"
                            ? Color(0xff8D62F7)
                            : Color(0xffEB6842),
                    iconPath: iconPath,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
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
                Text(
                  "₹ $price",
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
