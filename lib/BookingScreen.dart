import 'package:flutter/material.dart';
import 'classes/customer.dart';
import 'components/booking_form.dart';
import 'components/bookings_list.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  List<Customer> customers = [];
  double totalPrice = 0.0;
  bool showBookings = false;

  void addCustomer(Customer customer) {
    setState(() {
      customers.add(customer);
      totalPrice += customer.tripPrice;
      showBookings = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking successfully added')),
    );
  }

  void clearBookings() {
    setState(() {
      customers.clear();
      totalPrice = 0;
    });
  }

  void toggleView() {
    setState(() {
      showBookings = !showBookings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Booking Agency'),
        actions: [
          IconButton(
            icon: Icon(showBookings ? Icons.add : Icons.list),
            onPressed: toggleView,
            tooltip: showBookings ? 'New Booking' : 'Show Bookings',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: showBookings 
          ? BookingsList(
              customers: customers,
              totalPrice: totalPrice,
              onAddBooking: toggleView,
              onClearBookings: clearBookings,
            ) 
          : BookingForm(onAddCustomer: addCustomer),
      ),
    );
  }
}