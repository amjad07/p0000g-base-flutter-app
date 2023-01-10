import 'package:flutter/material.dart';
import 'package:flutter_base_project/helper/constants/flavor_resource.dart';
import 'package:flutter_base_project/helper/flavors/app_config.dart';
import 'package:flutter_base_project/main.dart';

void stagingMain() async {
  var flavor = const AppConfig(
    flavorName: stagingFlavor,
    baseUrl: stagingBaseUrl,
    child: MyApp(),
  );

  mainCommon();
  return runApp(flavor);
}
