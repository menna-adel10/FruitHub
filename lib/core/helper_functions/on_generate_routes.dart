import 'package:flutter/material.dart';
import 'package:fruit_hub/features/splash/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    default:
      return MaterialPageRoute(builder: (context)=> const Scaffold());
      // return MaterialPageRoute(
      //   builder: (context) =>
      //       Scaffold(
      //         appBar: AppBar(
      //           title: const Text('404 Not Found'),
      //         ),
      //         body: Center(
      //           child: const Text('Page not found'),
      //         ),
      //       ),
      // );

  }
}