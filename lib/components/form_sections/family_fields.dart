import 'package:flutter/material.dart';

class FamilyFields extends StatelessWidget {
  final TextEditingController primaryContactController;
  final TextEditingController insuranceCompanyController;
  final TextEditingController remainingFamilyMemberController;

  const FamilyFields({
    super.key,
    required this.primaryContactController,
    required this.insuranceCompanyController,
    required this.remainingFamilyMemberController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: primaryContactController,
          decoration: const InputDecoration(
            labelText: 'Primary Contact',
            border: OutlineInputBorder(),
            helperText: 'Main family contact for trip',
          ),
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Primary contact is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: insuranceCompanyController,
          decoration: const InputDecoration(
            labelText: 'Insurance Company',
            border: OutlineInputBorder(),
            helperText: 'Your family health insurance provider',
          ),
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Insurance company is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: remainingFamilyMemberController,
          decoration: const InputDecoration(
            labelText: 'Family Member Staying in Canada',
            border: OutlineInputBorder(),
            helperText: 'Name of family member not traveling',
          ),
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Family member name is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}