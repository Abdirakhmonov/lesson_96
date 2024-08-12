import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildHeader(),
          _buildMenuItem(Icons.home, 'Home'),
          _buildMenuItem(Icons.category, 'Categories'),
          _buildMenuItem(Icons.favorite_border, 'Favorites'),
          _buildMenuItem(Icons.shopping_bag_outlined, 'My orders'),
          const Divider(),
          _buildMenuItem(Icons.language, 'English | USD'),
          _buildMenuItem(Icons.headset_mic, 'Contact us'),
          _buildMenuItem(Icons.info_outline, 'About'),
          const Divider(),
          _buildTextItem('User agreement'),
          _buildTextItem('Partnership'),
          _buildTextItem('Privacy policy'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.grey[600]),
          ),
          const SizedBox(height: 12),
          const Text(
            'Sign in | Register',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      onTap: () {
        // Implement navigation logic here
      },
    );
  }

  Widget _buildTextItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey[600]),
      ),
    );
  }
}
