import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class RewardCarousel extends StatelessWidget {
  const RewardCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wd = MediaQuery.of(context).size.width;
    return CarouselSlider(
        items: [
          SizedBox(
            width: wd,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 12),
                    child: Image.asset("assets/Group 3304.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "10% cashback",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Activate offer to reveal \nthe code",
                      style: TextStyle(color: Color(0xff777778)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Activate",
                            style: TextStyle(color: Colors.black),
                          ),
                          const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: wd / 4,
                          ),
                          Image.asset(
                            "assets/Ellipse 112.png",
                            height: 65,
                            width: 65,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: wd,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 12),
                    child: Image.asset("assets/Group 3304.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "10% cashback",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Activate offer to reveal \nthe code",
                      style: TextStyle(color: Color(0xff777778)),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Activate",
                            style: TextStyle(color: Colors.black),
                          ),
                          const Icon(
                            Icons.arrow_right_alt,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: wd / 4,
                          ),
                          Image.asset(
                            "assets/Ellipse 112.png",
                            height: 65,
                            width: 65,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
        options: CarouselOptions(
            enlargeCenterPage: false,
            padEnds: false,
            height: wd / 2,
            viewportFraction: 0.7,
            enableInfiniteScroll: false));
  }
}

List<Widget> carouselItems = [
  SizedBox(
    width: 310,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/Group 3304.png"),
          const Text(
            "10% cashback",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    ),
  ),
  SizedBox(
    width: 250.97,
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/Group 3304.png"),
          const Text(
            "10% cashback",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    ),
  ),
];
