import 'package:bike_shopping_app/navigation/data/nav_item_data.dart';
import 'package:bike_shopping_app/providers/navigation_provider.dart';
import 'package:bike_shopping_app/theme/colors.dart';
import 'package:bike_shopping_app/navigation/widgets/bottom_nav_bar_item.dart';
import 'package:bike_shopping_app/utils/screen_measurements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentPageNumber = ref.watch(pageNavigationProvider);

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: CustomColors.greyColor.withOpacity(0.9),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenMeasurements.screenWidth(context) / 35,
            ),
            child: BottomNavBarItem(
              imagePath: navItemData[index],
              onTap: () {
                ref.read(pageNavigationProvider.notifier).navigateToPage(index);
              },
              selectedItem: currentPageNumber == index,
            ),
          );
        },
        itemCount: 5,
      ),
      // child: const Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     BottomNavBarItem(
      //       imagePath: "assets/images/Subtract.png",
      //       selectedItem: true,
      //     ),
      //     BottomNavBarItem(
      //       imagePath: "assets/images/map.fill.png",
      //     ),
      //     BottomNavBarItem(
      //       imagePath: "assets/images/cart.fill.png",
      //     ),
      //     BottomNavBarItem(
      //       imagePath: "assets/images/person.fill.png",
      //     ),
      //     BottomNavBarItem(
      //       imagePath: "assets/images/doc.text.fill.png",
      //     ),
      //   ],
      // ),
    );
  }
}
