import 'package:flutter/material.dart';
import 'package:screen_ui2/screens/screen_one.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => ScreenOne());
    }
  }
}
