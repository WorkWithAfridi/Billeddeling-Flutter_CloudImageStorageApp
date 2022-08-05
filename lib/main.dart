import 'package:billeddeling/app/data/constants/animations.dart';
import 'package:billeddeling/app/data/theme/theme.dart';
import 'package:billeddeling/app/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(const BilleddelingApp());
}

class BilleddelingApp extends StatelessWidget {
  const BilleddelingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ROUTES.getSplashRoute,
      getPages: ROUTES.routes,
      defaultTransition: appAnimationTransition,
      smartManagement: SmartManagement.onlyBuilder,
      theme: CustomTheme.lightTheme,
    );
  }
}
