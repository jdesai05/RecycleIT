import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSidebar extends StatelessWidget {
  const UserSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the current user from Firebase
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ✅ Custom Header with User Email as Username
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            accountName: Text(
              user?.email ?? "No Email", // Show email as username
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            accountEmail: Text(
              "", // No separate email field, only showing it as username
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.blue),
            ),
          ),

          // ✅ Menu Items
          _buildMenuItem(
            icon: Icons.home,
            text: "Home",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home');
            },
          ),
          _buildMenuItem(
            icon: Icons.settings,
            text: "Settings",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          _buildMenuItem(icon: Icons.notifications, text: "Notifications", onTap: () {}),
          _buildMenuItem(icon: Icons.nightlight_round, text: "Dark Mode", onTap: () {}),
          _buildMenuItem(icon: Icons.star, text: "Rate App", onTap: () {}),
          _buildMenuItem(icon: Icons.share, text: "Share App", onTap: () {}),
          _buildMenuItem(icon: Icons.lock, text: "Privacy Policy", onTap: () {}),
          _buildMenuItem(icon: Icons.description, text: "Terms and Conditions", onTap: () {}),
          _buildMenuItem(icon: Icons.contact_mail, text: "Contact", onTap: () {}),
          _buildMenuItem(icon: Icons.feedback, text: "Feedback", onTap: () {}),

          // ✅ Logout Button
          Divider(),
          _buildMenuItem(
            icon: Icons.logout,
            text: "Logout",
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
    );
  }

  /// Reusable function for menu items
  Widget _buildMenuItem({required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
