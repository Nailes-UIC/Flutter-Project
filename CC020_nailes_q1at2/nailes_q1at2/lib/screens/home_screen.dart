import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, String>> recommended = [
    {
      'title': 'Sound Of Water',
      'artist': 'Denise Brewer',
      'image': 'assets/images/img1.jpg',
    },
    {
      'title': 'The For Carnation',
      'artist': 'Dylan Meringur',
      'image': 'assets/images/img2.jpg',
    },
  ];

  final List<Map<String, dynamic>> playlists = [
    {
      'title': 'Chill Vibes',
      'tracks': 30,
      'likes': 251,
      'image': 'assets/images/img3.jpg',
    },
    {
      'title': 'Morning Energy',
      'tracks': 20,
      'likes': 100,
      'image': 'assets/images/img4.jpg',
    },
    {
      'title': 'Road Trip',
      'tracks': 25,
      'likes': 180,
      'image': 'assets/images/img5.jpg',
    },
    {
      'title': 'Focus Boost',
      'tracks': 18,
      'likes': 150,
      'image': 'assets/images/img6.jpg',
    },
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushNamed(context, '/categories');
        break;
      case 2:
        Navigator.pushNamed(context, '/albums');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildSectionTitle('Hot Recommended'),
            const SizedBox(height: 16),
            _buildRecommendedList(screenWidth),
            const SizedBox(height: 32),
            _buildSectionTitle('Hot Playlists', showViewAll: true),
            const SizedBox(height: 16),
            _buildPlaylistsGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.menu, color: Colors.white, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search album, song...',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.6)),
                filled: true,
                fillColor: const Color(0xFF282C4A),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/user.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool showViewAll = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (showViewAll)
            Text(
              'View All',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRecommendedList(double screenWidth) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommended.length,
        padding: const EdgeInsets.only(left: 16),
        itemBuilder: (context, index) {
          final item = recommended[index];
          return Container(
            width: screenWidth * 0.45,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E223D),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    item['image']!,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['artist']!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaylistsGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: playlists.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final playlist = playlists[index];
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E223D),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    playlist['image'],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      playlist['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.favorite, color: Color(0xFFEA0B3F), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${playlist['likes']}',
                          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.music_note, color: Color(0xFFEA0B3F), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${playlist['tracks']} tracks',
                          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.white54,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: 'Song',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.album_outlined),
          activeIcon: Icon(Icons.album),
          label: 'Albums',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
