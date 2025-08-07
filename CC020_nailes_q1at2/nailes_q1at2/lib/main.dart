import 'package:flutter/material.dart';
import 'screens/greet_screen.dart';
import 'screens/home_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/albums_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      ),
      initialRoute: '/greet', // 👈 Start from the greet screen
      routes: {
        '/greet': (context) => GreetScreen(),         // 👈 New
        '/home': (context) => HomeScreen(),
        '/categories': (context) => CategoriesScreen(),
        '/albums': (context) => AlbumsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
