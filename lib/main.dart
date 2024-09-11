import 'package:bike_shopping_app/navigation/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: BikeShoppingApp(),
    ),
  );
}

class BikeShoppingApp extends StatelessWidget {
  const BikeShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bike Shopping App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const BottomNavigationController(),
    );
  }
}
