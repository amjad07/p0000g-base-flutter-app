class NavigationProvider {

  String currentState = "Active";
  String currentNav = "Home";
  void updateNavigation(String nav) {
    currentNav = nav;
  }
  void updateState(String state) {
    currentState = state;
  }
}