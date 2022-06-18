import 'package:animal_detection/app/dependencies.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Detection',
      theme: ThemeData(
          primarySwatch: Colors.red,
          cardColor: const Color(0xFF101010),
          primaryColor: const Color(0xFFFD057F),
          backgroundColor: Colors.black),
      navigatorKey: StackedService.navigatorKey,
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
