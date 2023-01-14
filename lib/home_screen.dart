import 'package:flutter/material.dart';
import 'package:instantsy/repsoitory/fetch_data.dart';
import 'package:instantsy/screens/movie_screen.dart';
import 'package:instantsy/screens/person_screen.dart';
import 'package:instantsy/screens/showScreen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _screens = [
    MovieScreen(),
    ShowScreen(),
    PersonScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie app'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: 'Tv Show'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person')
        ],
      ),
    );
  }
}
