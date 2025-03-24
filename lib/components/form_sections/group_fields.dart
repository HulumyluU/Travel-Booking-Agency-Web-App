import 'package:flutter/material.dart';

class GroupFields extends StatelessWidget {
  final TextEditingController groupInsuranceController;
  final TextEditingController organizingHardwareController;
  final TextEditingController acceptingCompanyController;

  const GroupFields({
    super.key,
    required this.groupInsuranceController,
    required this.organizingHardwareController,
    required this.acceptingCompanyController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: groupInsuranceController,
          decoration: const InputDecoration(
            labelText: 'Group Insurance Number',
            border: OutlineInputBorder(),
            helperText: 'Group travel insurance policy number',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Group insurance number is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: organizingHardwareController,
          decoration: const InputDecoration(
            labelText: 'Organizing Hardware',
            border: OutlineInputBorder(),
            helperText: 'Equipment needed (e.g., whistles, flags)',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Organizing hardware is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        TextFormField(
          controller: acceptingCompanyController,
          decoration: const InputDecoration(
            labelText: 'Destination Company',
            border: OutlineInputBorder(),
            helperText: 'Company receiving your group at destination',
          ),
          textCapitalization: TextCapitalization.words,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Destination company is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}