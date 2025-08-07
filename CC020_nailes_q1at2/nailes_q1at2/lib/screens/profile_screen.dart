import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/categories');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/albums');
        break;
      case 3:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Your Profile"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.jpg'),
            ),
            const SizedBox(height: 15),
            const Text(
              "Stephen Craine",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 5),
            const Text(
              "student@musicapp.com",
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.redAccent),
                    title: const Text('Edit Info', style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16),
                    onTap: () {},
                  ),
                  const Divider(color: Colors.white24),
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.redAccent),
                    title: const Text('Change Password', style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16),
                    onTap: () {},
                  ),
                  const Divider(color: Colors.white24),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.redAccent),
                    title: const Text('Logout', style: TextStyle(color: Colors.white)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
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
