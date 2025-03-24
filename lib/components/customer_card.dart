import 'package:flutter/material.dart';
import '../classes/customer.dart';
import '../classes/individual.dart';
import '../classes/family.dart';
import '../classes/group.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;
  final int index;

  const CustomerCard({
    super.key,
    required this.customer,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    String customerType = 'Customer';
    Color typeColor = Colors.blue;
    
    if (customer is Individual) {
      customerType = 'Individual';
      typeColor = Colors.blue;
    } else if (customer is Family) {
      customerType = 'Family';
      typeColor = Colors.green;
    } else if (customer is Group) {
      customerType = 'Group';
      typeColor = Colors.orange;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '👤 Customer ${index + 1}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: typeColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    customerType,
                    style: TextStyle(
                      color: typeColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              customer.toString(),
              style: const TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}