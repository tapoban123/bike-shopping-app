import 'package:bike_shopping_app/theme/colors.dart';
import 'package:flutter/material.dart';

class FilterIcon extends StatefulWidget {
  final String? imagePath;
  final double height;
  final bool itemAll;
  final bool selectedItem;

  const FilterIcon({
    super.key,
    required this.height,
    this.imagePath,
    this.itemAll = false,
    this.selectedItem = false,
  });

  @override
  State<FilterIcon> createState() => _FilterIconState();
}

class _FilterIconState extends State<FilterIcon> {
  LinearGradient selectedGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        CustomColors.lightBlueColor.withOpacity(0.75),
        CustomColors.deepBlueColor.withOpacity(0.75),
      ],
    );
  }

  LinearGradient unSelectedGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        CustomColors.greyColor.withOpacity(0.75),
        CustomColors.darkColor.withOpacity(0.75),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: widget.selectedItem
                ? selectedGradient()
                : unSelectedGradient(),
            borderRadius: BorderRadius.circular(14),
          ),
          child: widget.itemAll
              ? const Center(
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 15,
                    ),
                  ),
                )
              : Image.asset(widget.imagePath!),
        ),
        SizedBox(
          height: widget.height,
        ),
      ],
    );
  }
}
