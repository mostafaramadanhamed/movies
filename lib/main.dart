import 'package:flutter/material.dart';
import 'package:movies/core/services/service_locator.dart';
import 'package:movies/core/utils/constant.dart';
import 'package:movies/movie/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,

      ),
      debugShowCheckedModeBanner: false,
      home: const MoviesScreen(),
    );
  }
}