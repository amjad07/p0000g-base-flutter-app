import 'dart:async';

import 'package:flutter_base_project/presentation/navbar/navigation_provider.dart';

class NavigationDrawerBloc {
  final navigationController = StreamController();
  NavigationProvider navigationProvider = NavigationProvider();

  Stream get getNavigation => navigationController.stream;

  void updateNavigation(String navigation) {
    navigationProvider.updateNavigation(navigation);
    navigationController.sink.add(navigationProvider.currentNav);
  }

  void dispose() {
    navigationController.close();
  }
}
