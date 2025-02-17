import 'package:flutter/material.dart';
import 'package:recycleit/screens/Request.dart'; // Import RequestPage

class OperatorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String address;

  const OperatorCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rounded Image
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 60, color: Colors.grey),
              ),
            ),

            const SizedBox(width: 12), // Spacing

            // Column for Name, Address, and Button
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4), // Spacing

                  // Address
                  Text(
                    address,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8), // Spacing

                  // Send Request Button
                  SizedBox(
                    width: double.infinity, // Button takes full width
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to RequestPage when button is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RequestPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(76, 175, 80, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Send Request",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
