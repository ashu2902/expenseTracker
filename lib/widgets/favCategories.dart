import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class FavCat extends StatefulWidget {
  const FavCat({Key? key}) : super(key: key);

  @override
  State<FavCat> createState() => _FavCatState();
}

class _FavCatState extends State<FavCat> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "favourite Categories",
              style: TextStyle(fontSize: 18),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "manage",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CategoryIcon(
              color: Color(0xffEB6842),
              iconPath: "assets/food_icon.png",
            ),
            CategoryIcon(
              color: Color(0xff77ADD9),
              iconPath: "assets/entertainment_icon.png",
            ),
            CategoryIcon(
              color: Color(0xff8D62F7),
              iconPath: "assets/shopping_icon.png",
            ),
          ],
        ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({required this.color, required this.iconPath, Key? key})
      : super(key: key);
  final Color? color;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SleekCircularSlider(
        appearance: CircularSliderAppearance(
          startAngle: 0,
          size: 110,
          angleRange: 360,
          customColors: CustomSliderColors(
            trackColor: Colors.grey,
            progressBarColor: color,
          ),
          customWidths: CustomSliderWidths(progressBarWidth: 5),
        ),
        min: 0,
        max: 30,
        initialValue: 20,
        innerWidget: (double value) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: Image.asset(
                iconPath,
                height: 64.75,
                width: 64.75,
              ),
            ),
          );
        },
      ),
    );
  }
}
