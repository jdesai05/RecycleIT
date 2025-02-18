import 'package:flutter/material.dart';
import 'OperatorCard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Operators List")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          OperatorCard(
            imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
            name: "Jainil Desai",
            address: "1234 Park Street, New York",
          ),
          OperatorCard(
            imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
            name: "Shreenithi U",
            address: "5678 Lakeview Rd, California",
          ),
          OperatorCard(
            imageUrl: "https://randomuser.me/api/portraits/men/3.jpg",
            name: "Daksh Chandiramani",
            address: "910 Elm Drive, Texas",
          ),
        ],
      ),
    );
  }
}
