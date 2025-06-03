import 'package:e_commerce/features/auth/login/presentation/page/login.dart';
import 'package:e_commerce/features/auth/sign_up/presentation/pages/signup.dart';
import 'package:e_commerce/features/presentation/pages/item.dart';
import 'package:e_commerce/features/undeine_page.dart';
import 'package:flutter/material.dart';

import '../../features/presentation/pages/tabs.dart';

class Routes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String home = '/home';
  static const String products = '/products';
  static const String item = '/item';
}

class AppRoutes {
  static Route onGenerate(RouteSettings routsSettings) {
    switch (routsSettings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.item:
        return MaterialPageRoute(
            builder: (_) => Item(id: routsSettings.arguments as String ?? ""));
      default:
        return MaterialPageRoute(builder: (_) => const UndefinePage());
    }
  }
}
