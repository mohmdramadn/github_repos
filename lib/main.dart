import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:github_repos/routes/router.dart';
import 'package:github_repos/theme/theme.dart';
import 'package:injectable/injectable.dart';

import 'main.config.dart';


final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)

void configureDependencies() => $initGetIt(getIt);

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
          defaultTransition: Transition.cupertino,
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          supportedLocales: const [Locale('en')],
          locale: const Locale('en'),
          debugShowMaterialGrid: false,
          title: 'Github Repos',
          theme: appThemeData,
          onGenerateRoute: onGenerateRoute,
          opaqueRoute: Get.isOpaqueRouteDefault,
          color: Colors.white,
        )
    );
  }
}
