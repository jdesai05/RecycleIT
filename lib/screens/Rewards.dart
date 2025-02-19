import 'package:flutter/material.dart';
import 'package:recycleit/widgets/CouponsCard.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  int userCredits = 500; // Example starting credits

  void redeemCoupon(int price, String title) {
    if (userCredits >= price) {
      setState(() {
        userCredits -= price;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$title redeemed for $price credits!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not enough credits!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Credits Display
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:  Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Current Credits:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '$userCredits', // Display user credits dynamically
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Spacing between credits and coupon list

            // List of Coupons
            Expanded(
              child: ListView(
                children: [
                  CouponsCard(
                    title: 'Google Play Gift Card',
                    description: 'Redeem this card to get credit on Google Play for apps, games, movies, books, and more.',
                    price: 200,
                    onRedeem: () => redeemCoupon(200, 'Google Play Gift Card'),
                  ),
                  const SizedBox(height: 15),

                  CouponsCard(
                    title: 'Amazon Gift Card',
                    description: 'Use this card to shop for millions of items on Amazon.com. No expiration date.',
                    price: 300,
                    onRedeem: () => redeemCoupon(300, 'Amazon Gift Card'),
                  ),
                  const SizedBox(height: 15),

                  CouponsCard(
                    title: 'Starbucks Gift Card',
                    description: 'Enjoy your favorite Starbucks beverages with this gift card. Redeem it at any Starbucks location.',
                    price: 150,
                    onRedeem: () => redeemCoupon(150, 'Starbucks Gift Card'),
                  ),
                  const SizedBox(height: 15),

                  CouponsCard(
                    title: 'iTunes Gift Card',
                    description: 'Redeem this card for music, movies, TV shows, apps, and more on iTunes and the App Store.',
                    price: 250,
                    onRedeem: () => redeemCoupon(250, 'iTunes Gift Card'),
                  ),
                  const SizedBox(height: 15),

                  CouponsCard(
                    title: 'Netflix Gift Card',
                    description: 'Use this card to enjoy unlimited movies and TV shows on Netflix.',
                    price: 350,
                    onRedeem: () => redeemCoupon(350, 'Netflix Gift Card'),
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
