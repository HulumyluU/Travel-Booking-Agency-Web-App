import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final int totalBookings;
  final double totalPrice;

  const SummaryCard({
    Key? key,
    required this.totalBookings,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '📊 Booking Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Total Bookings: $totalBookings',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '💰 Total Price: \$${totalPrice.toInt()}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}