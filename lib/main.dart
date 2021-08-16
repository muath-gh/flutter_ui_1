import 'package:flutter/material.dart';
import 'package:screen_ui2/app_router.dart';

void main() {
  runApp(Main(
    appRoute: AppRouter(),
  ));
}

class Main extends StatelessWidget {
  final AppRouter appRoute;
  Main({@required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRoute.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
