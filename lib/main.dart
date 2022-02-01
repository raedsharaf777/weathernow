import 'package:flutter/material.dart';
import 'screens/loaded_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      home:LoadedScreen(),
      // initialRoute: '/loaded',
      //  routes: {
      //    '/loaded': (_) => LoadedScreen(),
      //    '/home': (_) => HomeScreen(),
      //  },
    );
  }
}
