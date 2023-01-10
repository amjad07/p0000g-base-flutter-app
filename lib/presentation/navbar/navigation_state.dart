
import 'package:flutter_base_project/presentation/navbar/nav_bar_items.dart';
import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}