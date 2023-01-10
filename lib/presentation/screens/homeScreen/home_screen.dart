import 'package:flutter/material.dart';
import 'package:flutter_base_project/presentation/navbar/nav_bar_items.dart';
import 'package:flutter_base_project/presentation/navbar/navigation_cubit.dart';
import 'package:flutter_base_project/presentation/navbar/navigation_state.dart';
import 'package:flutter_base_project/presentation/screens/page_one.dart';
import 'package:flutter_base_project/presentation/screens/page_two.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../page_four.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter base project"),
      ),
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        return bottomNavBar(state);
      }),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return const PageOne();
        } else if (state.navbarItem == NavbarItem.settings) {
          return const PageFour();
        } else if (state.navbarItem == NavbarItem.profile) {
          return const PageOne();
        }
        return Container();
      }),
    );
  }

  BottomNavigationBar bottomNavBar(NavigationState state ) {
    return BottomNavigationBar(
      currentIndex: state.index,
      showUnselectedLabels: false,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          BlocProvider.of<NavigationCubit>(context)
              .getNavBarItem(NavbarItem.home);
        } else if (index == 1) {
          BlocProvider.of<NavigationCubit>(context)
              .getNavBarItem(NavbarItem.settings);
        } else if (index == 2) {
          BlocProvider.of<NavigationCubit>(context)
              .getNavBarItem(NavbarItem.profile);
        }
      },
    );
  }
}
