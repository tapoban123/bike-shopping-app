import 'package:bike_shopping_app/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);
      
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.scaffoldBgColor,
      toolbarHeight: 100,
      title: const Text(
        "Choose Your Bike",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins",
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CustomColors.lightBlueColor,
                  CustomColors.deepBlueColor,
                ],
              ),
            ),
            child: Image.asset("assets/images/Vector.png"),
          ),
        )
      ],
    );
  }
}
