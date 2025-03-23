import 'package:flutter/material.dart';

class CommonFields extends StatelessWidget {
  final TextEditingController destinationController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController contactNameController;
  final TextEditingController priceController;

  const CommonFields({
    Key? key,
    required this.destinationController,
    required this.phoneController,
    required this.emailController,
    required this.contactNameController,
    required this.priceController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: destinationController,
          decoration: const InputDecoration(
            labelText: 'Destination',
            border: OutlineInputBorder(),
            helperText: 'Where are you traveling to?',
          ),
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Destination is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(
            labelText: 'Contact Phone',
            border: OutlineInputBorder(),
            helperText: 'Format: 123-456-7890 or 1234567890',
          ),
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone number is required';
            }
            // Validate phone format
            final RegExp phoneRegex = RegExp(r'^(\d{3}-\d{3}-\d{4}|\d{10})$');
            if (!phoneRegex.hasMatch(value)) {
              return 'Please enter a valid phone number (123-456-7890 or 1234567890)';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(),
            helperText: 'Your email for booking confirmations',
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            // Simple email validation
            final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: contactNameController,
          decoration: const InputDecoration(
            labelText: 'Contact Name',
            border: OutlineInputBorder(),
            helperText: 'Full name of the main contact person',
          ),
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Contact name is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: priceController,
          decoration: const InputDecoration(
            labelText: 'Trip Price',
            border: OutlineInputBorder(),
            helperText: 'Total cost of the trip in dollars',
            prefixText: '\$ ',
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Trip price is required';
            }
            try {
              double price = double.parse(value);
              if (price <= 0) {
                return 'Price must be greater than 0';
              }
            } catch (e) {
              return 'Please enter a valid number';
            }
            return null;
          },
        ),
      ],
    );
  }
}