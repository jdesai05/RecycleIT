import 'package:flutter/material.dart';
import 'package:recycleit/screens/HomeScreen.dart';
import 'SettingsScreen.dart';  // Import the SettingsScreen widget

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.account_circle, size: 50, color: Colors.white),
                SizedBox(height: 10),
                Text("Hello, User!",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
          _buildMenuItem(
            icon: Icons.home,
            text: "Home",
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
                (route) => false, // Removes all previous routes from the stack
              );
            },
          ),

          _buildMenuItem(
            icon: Icons.settings,
            text: "Settings",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
          _buildMenuItem(
            icon: Icons.logout,
            text: "Logout",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  /// Reusable function for menu items
  Widget _buildMenuItem(
      {required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
