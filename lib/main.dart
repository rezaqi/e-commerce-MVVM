import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  String route = Routes.home;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp(rout: route));
}

class MyApp extends StatelessWidget {
  final String rout;
  const MyApp({super.key, required this.rout});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.secondary),
        debugShowCheckedModeBanner: false,
        title: "E-Commerce",
        initialRoute: rout,
        onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
      ),
    );
  }
}
