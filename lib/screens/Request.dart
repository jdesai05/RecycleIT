import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final TextEditingController _weightController = TextEditingController();
  double _calculatedValue = 0.0;

  void _calculateValue() {
    double? weight = double.tryParse(_weightController.text);
    if (weight != null) {
      setState(() {
        _calculatedValue = weight * 5; // Example calculation (Price = Weight * 5)
      });
    } else {
      setState(() {
        _calculatedValue = 0.0; // Reset value on invalid input
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Request Service")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weight Input Field
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter weight (kg)",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _calculateValue(),
            ),

            const SizedBox(height: 20), // Spacing

            // Calculation Result
            Text(
              "Calculated Value: \$$_calculatedValue",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }
}
