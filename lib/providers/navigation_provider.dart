import 'package:flutter_riverpod/flutter_riverpod.dart';

StateNotifierProvider<NavigationNotifier, int> pageNavigationProvider =
    StateNotifierProvider(
  (ref) => NavigationNotifier(),
);

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void navigateToPage(int pageNumber) {
    state = pageNumber;
  }
}
