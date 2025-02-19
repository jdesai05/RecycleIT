import 'package:flutter/material.dart';

class CouponsCard extends StatelessWidget {
  final String title;
  final String description;
  final int price;
  final VoidCallback onRedeem; // Callback function for redeeming

  const CouponsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.price,
    required this.onRedeem,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coupon Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4), // Spacing

            // Coupon Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8), // Spacing

            // Redeem Button with Price
            SizedBox(
              width: double.infinity, // Button takes full width
              child: ElevatedButton(
                onPressed: onRedeem, // Calls the redeem function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Redeem for $price credits",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
