import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 1;

  final categories = [
    {'label': 'New Releases', 'color': Colors.redAccent},
    {'label': 'Podcasts', 'color': Colors.lightGreen},
    {'label': 'Artists', 'color': Colors.pinkAccent},
    {'label': 'Hip Hop', 'color': Colors.blueAccent},
    {'label': 'Pop', 'color': Colors.grey},
    {'label': 'Jazz', 'color': Colors.green},
    {'label': 'Metal', 'color': Colors.indigo},
    {'label': 'Fitness', 'color': Colors.purpleAccent},
    {'label': 'RnB', 'color': Colors.greenAccent},
    {'label': 'Hip Hop', 'color': Colors.pink},
    {'label': 'Jazz', 'color': Colors.green},
    {'label': 'Metal', 'color': Colors.blueGrey},
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/albums');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Browse Categories"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 2.8,
          children: categories.map((item) {
            return Container(
              decoration: BoxDecoration(
                color: item['color'] as Color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  item['label'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Albums'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
