import 'package:flutter/material.dart';
import '../classes/customer.dart';
import 'customer_card.dart';
import 'summary_card.dart';

class BookingsList extends StatelessWidget {
  final List<Customer> customers;
  final double totalPrice;
  final VoidCallback onAddBooking;
  final VoidCallback onClearBookings;

  const BookingsList({
    Key? key,
    required this.customers,
    required this.totalPrice,
    required this.onAddBooking,
    required this.onClearBookings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (customers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No bookings yet',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onAddBooking,
              child: const Text('Add a Booking'),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📌 All Bookings:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: customers.length,
            itemBuilder: (context, index) {
              return CustomerCard(
                customer: customers[index],
                index: index,
              );
            },
          ),
        ),
        SummaryCard(
          totalBookings: customers.length,
          totalPrice: totalPrice,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: onAddBooking,
              child: const Text('Add Another Booking'),
            ),
            ElevatedButton(
              onPressed: onClearBookings,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Clear All Bookings'),
            ),
          ],
        ),
      ],
    );
  }
}