import 'package:flutter/material.dart';
import 'package:recycleit/widgets/Home.dart';
import 'package:recycleit/widgets/LocationScreen.dart';
import 'package:recycleit/widgets/SettingsScreen.dart';
import 'package:recycleit/widgets/UserSideBar.dart';
import 'package:recycleit/widgets/CameraWidget.dart';
import 'Rewards.dart'; // Import RewardsScreen
import '../widgets/Navbar.dart'; // Import your custom BottomNavBar widget
import 'package:recycleit/widgets/ChatbotWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home(),
    CameraWidget(),
    LeafletMapScreen(),
    RewardsPage(), // Added Rewards Screen to the list
    ChatbotWidget(), // Added Chatbot Widget to the list
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Prevents auto-back button
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu), // Sidebar Menu Icon
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings), // Corrected: Settings Icon
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      drawer: const UserSidebar(), // Left Drawer (User Sidebar)
      endDrawer: const Drawer(child: SettingsScreen()), // Right Drawer (Settings)
      body: _screens[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomNavBar( // Keep your custom BottomNavBar
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatbotWidget()),
          );
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.green,
      ),
    );
  }
}
