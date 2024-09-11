import 'package:bike_shopping_app/theme/colors.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatefulWidget {
  final String imagePath;
  final bool selectedItem;
  final VoidCallback onTap;

  const BottomNavBarItem({
    super.key,
    required this.imagePath,
    required this.onTap,
    this.selectedItem = false,
  });

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  Widget selectedIcon(String imagePath) {
    return Container(
      width: 80,
      height: 50,
      transform: Matrix4.skewY(3),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: CustomColors.darkColor,
              offset: Offset(-4, 5))
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.lightBlueColor,
            CustomColors.deepBlueColor,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(imagePath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: widget.onTap,
      icon: widget.selectedItem
          ? selectedIcon(widget.imagePath)
          : Image.asset(widget.imagePath),
    );
  }
}
