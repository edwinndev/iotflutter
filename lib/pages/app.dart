import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iot/utils/constants.dart';
import 'package:iot/utils/routes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: false,
      debugShowCheckedModeBanner: false,
      title: AppUtil.title,
      routes: Routes.routes,
      initialRoute: Routes.home,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
    );
  }
}