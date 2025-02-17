import 'package:flutter/material.dart';
import 'package:recycleit/screens/LoginForm.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true; // Toggle state for Notification switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes default back button
        title: Row(
          children: [
            Icon(Icons.settings, size: 30, color: Colors.green), // ✅ Settings icon
            SizedBox(width: 10),
            Text("Settings", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // ✅ Back button
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          _buildSettingsItem(
            icon: Icons.notifications,
            text: "Notification",
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
          ),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.dark_mode, text: "Dark Mode"),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.star, text: "Rate App"),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.share, text: "Share App"),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.lock, text: "Privacy Policy"),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.description, text: "Terms and Conditions"),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.cookie, text: "Cookies Policy"),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.email, text: "Contact"),
          _buildDivider(),
          _buildSettingsItem(icon: Icons.feedback, text: "Feedback"),
          _buildDivider(),
          _buildSettingsItem(
            icon: Icons.logout,
            text: "Logout",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginForm()),
              );
            },
          ),
        ],
      ),
    );
  } 

  /// Reusable method to build each setting item
  Widget _buildSettingsItem({required IconData icon, required String text, Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, size: 24, color: Colors.black87),
      title: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: trailing,
      onTap: onTap,
    );
  }

  /// Divider to separate each setting item
  Widget _buildDivider() {
    return Divider(
      thickness: 1,
      indent: 16,
      endIndent: 16,
      color: Colors.grey.shade300,
    );
  }
}
