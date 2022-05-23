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
    var slider = SleekCircularSlider(
      appearance: CircularSliderAppearance(
        startAngle: 0,
        size: 120,
        angleRange: 360,
        customColors: CustomSliderColors(
            trackColor: Colors.grey, progressBarColor: Color(0xffEB6842)),
        customWidths: CustomSliderWidths(progressBarWidth: 5),
      ),
      min: 0,
      max: 30,
      initialValue: 20,
      innerWidget: (double value) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffEB6842)),
            child: Image.asset("assets/food_icon.png"),
          ),
        );
      },
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Favourite Categories"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "manage",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        Row(
          children: [slider],
        ),
      ],
    );
  }
}
