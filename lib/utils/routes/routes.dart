import 'package:flutter/material.dart';
import 'package:mvvm_file_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_file_architecture/view/home_screen.dart' as HomeScreenView;
import 'package:mvvm_file_architecture/view/login_view.dart' as LoginView;
import 'package:mvvm_file_architecture/view/splash_scree.dart' as SplashScreen;

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashcreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const SplashScreen.SplashScreen());

      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const HomeScreenView.HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView.LoginView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
