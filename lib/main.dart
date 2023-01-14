import 'package:flutter/material.dart';
import 'package:instantsy/home_screen.dart';
import 'package:instantsy/repsoitory/fetch_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (context) => FetchData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
