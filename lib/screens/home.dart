import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String requestStatus = "Pending"; // Default status

  void approveRequest() {
    setState(() {
      requestStatus = "Approved ✅";
    });
    _showMessage("Request Approved! 🎉 Reward Granted.");
  }

  void declineRequest() {
    setState(() {
      requestStatus = "Declined ❌";
    });
    _showMessage("Request Declined. No reward given.");
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Request",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40), // Increased padding
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.green,
                  ), // Bigger icon
                  const SizedBox(height: 15),
                  const Text(
                    "User Request",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ), // Larger text
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Status: $requestStatus",
                    style: TextStyle(
                      fontSize: 18, // Bigger font
                      fontWeight: FontWeight.w500,
                      color:
                          requestStatus == "Approved ✅"
                              ? Colors.green
                              : requestStatus == "Declined ❌"
                              ? Colors.red
                              : const Color.fromARGB(255, 255, 140, 0),
                    ),
                  ),
                  const SizedBox(height: 25), // More spacing
                  ElevatedButton(
                    onPressed:
                        requestStatus == "Pending" ? approveRequest : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(
                        double.infinity,
                        55,
                      ), // Larger button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Accept Request",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:
                        requestStatus == "Pending" ? declineRequest : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(
                        double.infinity,
                        55,
                      ), // Larger button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Decline Request",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
