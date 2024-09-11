import 'package:bike_shopping_app/pages/doc_page.dart';
import 'package:bike_shopping_app/pages/home/widgets/home_appbar.dart';
import 'package:bike_shopping_app/pages/home/home_page.dart';
import 'package:bike_shopping_app/pages/map_page.dart';
import 'package:bike_shopping_app/pages/profile_page.dart';
import 'package:bike_shopping_app/pages/shopping_cart_page.dart';
import 'package:bike_shopping_app/providers/navigation_provider.dart';
import 'package:bike_shopping_app/theme/colors.dart';
import 'package:bike_shopping_app/navigation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationController extends ConsumerStatefulWidget {
  const BottomNavigationController({super.key});

  @override
  ConsumerState<BottomNavigationController> createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends ConsumerState<BottomNavigationController> {
  late int currentPage;

  List<Widget> pages = const [
    HomePage(),
    MapPage(),
    ShoppingCartPage(),
    ProfilePage(),
    DocPage(),
  ];

  @override
  Widget build(BuildContext context) {
    currentPage = ref.watch(pageNavigationProvider);

    return Scaffold(
      backgroundColor: CustomColors.scaffoldBgColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HomeAppbar(),
      ),
      extendBody: true,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
    );
  }
}
