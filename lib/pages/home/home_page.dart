import 'dart:ui';

import 'package:bike_shopping_app/pages/home/data/filter_icon_data.dart';
import 'package:bike_shopping_app/theme/colors.dart';
import 'package:bike_shopping_app/pages/home/widgets/filter_icon.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double filterIconHeight = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned(
              right: -150,
              top: 100,
              child: Transform.rotate(
                angle: math.pi / 7,
                child: Container(
                  width: 400,
                  height: 700,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          CustomColors.lightBlueColor,
                          CustomColors.deepBlueColor,
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    height: 280,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ClipPath(
                        clipper: ImageCustomClipper(),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomColors.greyColor.withOpacity(0.5),
                              border: Border.all(
                                width: 4,
                                color: CustomColors.greyColor,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                    "assets/images/Electric_Bicycle.png"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "30% Off",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 26,
                                          color: CustomColors.whiteColor
                                              .withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilterIcon(
                        height: filterIconHeight,
                        itemAll: true,
                        selectedItem: true,
                      ),
                      FilterIcon(
                        height: filterIconHeight += 20,
                        imagePath: filterIconData[0],
                      ),
                      FilterIcon(
                        height: filterIconHeight += 20,
                        imagePath: filterIconData[1],
                      ),
                      FilterIcon(
                        height: filterIconHeight += 20,
                        imagePath: filterIconData[2],
                      ),
                      FilterIcon(
                        height: filterIconHeight += 20,
                        imagePath: filterIconData[3],
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 200,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 24),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Transform(
                            transform: Matrix4.skewY(3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 50,
                                  sigmaY: 50,
                                ),
                                child: Container(
                                  width: 100,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color:
                                        CustomColors.greyColor.withOpacity(0.7),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(18),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          "assets/images/robert_bicyle.png",
                                          fit: BoxFit.scaleDown,
                                          height: 90,
                                        ),
                                      ),
                                      Text(
                                        "Road Bike",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                      Text("PEUGEOT - LR01"),
                                      Text(r"$1999.99"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double width = size.width;
    double height = size.height;

    Path path = Path();

    // line to top left point
    path.lineTo(width, 0);

    // line to bottom right point
    path.lineTo(width, height * 0.74);

    path.conicTo(width, height * 0.88, 0, height, 2);

    // line to bottom left point
    path.lineTo(0, height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
