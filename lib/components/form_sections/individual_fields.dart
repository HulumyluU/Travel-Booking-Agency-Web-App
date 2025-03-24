import 'package:flutter/material.dart';

class IndividualFields extends StatelessWidget {
  final TextEditingController homeAddressController;
  final TextEditingController insuranceNumberController;
  final TextEditingController workPlaceController;

  const IndividualFields({
    super.key,
    required this.homeAddressController,
    required this.insuranceNumberController,
    required this.workPlaceController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: homeAddressController,
          decoration: const InputDecoration(
            labelText: 'Home Address',
            border: OutlineInputBorder(),
            helperText: 'Your residential address',
          ),
          keyboardType: TextInputType.streetAddress,
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Home address is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: insuranceNumberController,
          decoration: const InputDecoration(
            labelText: 'Insurance Number',
            border: OutlineInputBorder(),
            helperText: 'Format: P12345',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Insurance number is required';
            }
            // Validate insurance number format
            final RegExp regex = RegExp(r'^[Pp]\d{5}$');
            if (!regex.hasMatch(value)) {
              return 'Please use format P12345';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: workPlaceController,
          decoration: const InputDecoration(
            labelText: 'Workplace',
            border: OutlineInputBorder(),
            helperText: 'Your current employer',
          ),
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Workplace is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}