import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_project/helper/constants/colors_resource.dart';
import 'package:flutter_base_project/helper/constants/constants_resource.dart';
import 'package:flutter_base_project/helper/constants/flavor_resource.dart';
import 'package:flutter_base_project/helper/constants/routes.dart';
import 'package:flutter_base_project/presentation/navbar/navigation_cubit.dart';
import 'package:flutter_base_project/presentation/screens/homeScreen/counter_cubit.dart';
import 'package:flutter_base_project/presentation/screens/homeScreen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'helper/flavors/main_acceptance.dart';
import 'helper/flavors/main_dev.dart';
import 'helper/flavors/main_production.dart';
import 'helper/flavors/main_staging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String packageName = packageInfo.packageName;
  log("packageName => $packageName");
  if (packageName == stagingPackageName) {
    return stagingMain();
  } else if (packageName == acceptancePackageName) {
    return acceptanceMain();
  } else if (packageName == developmentPackageName) {
    return developmentMain();
  } else {
    return productionMain();
  }
}

void mainCommon() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String packageName = packageInfo.packageName;
  log("packageName => $packageName");
  await Future.delayed(const Duration(seconds: splashDelay));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
        BlocProvider(create: (_) => CounterCubit()),
      ],
      child: MaterialApp(
        initialRoute: homeScreenRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          cardColor: colorCardBackground,
          primaryColorDark: primaryColorDark,
          backgroundColor: Colors.red,
          primaryColor: primaryColor,
          fontFamily: 'Arial',
          appBarTheme: AppBarTheme(
              backgroundColor: primaryColorDark,
              titleTextStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white)),
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
            headline3: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
            headline4: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
            headline5: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),
            headline6: TextStyle(fontSize: 12.0, fontStyle: FontStyle.normal),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        routes: {
          homeScreenRoute: (context) => const MyHomePage(),
        },
      ),
    );
  }
}
