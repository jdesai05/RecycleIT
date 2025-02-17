import 'package:flutter/material.dart';
import 'package:recycleit/widgets/CouponsCard.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // Google Play Gift Card Coupon
            CouponsCard(
              title: 'Google Play Gift Card',
              description: 'Redeem this card to get credit on Google Play for apps, games, movies, books, and more.',
            ),
            const SizedBox(height: 15), // Spacing between cards

            // Amazon Gift Card Coupon
            CouponsCard(
              title: 'Amazon Gift Card',
              description: 'Use this card to shop for millions of items on Amazon.com. No expiration date.',
            ),
            const SizedBox(height: 15),

            // Starbucks Gift Card Coupon
            CouponsCard(
              title: 'Starbucks Gift Card',
              description: 'Enjoy your favorite Starbucks beverages with this gift card. Redeem it at any Starbucks location.',
            ),
            const SizedBox(height: 15),

            // iTunes Gift Card Coupon
            CouponsCard(
              title: 'iTunes Gift Card',
              description: 'Redeem this card for music, movies, TV shows, apps, and more on iTunes and the App Store.',
            ),
            const SizedBox(height: 15),

            // Netflix Gift Card Coupon
            CouponsCard(
              title: 'Netflix Gift Card',
              description: 'Use this card to enjoy unlimited movies and TV shows on Netflix.',
            ),
          ],
        ),
      ),
    );
  }
}
