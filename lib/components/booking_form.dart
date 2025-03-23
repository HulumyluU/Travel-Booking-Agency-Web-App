import 'package:flutter/material.dart';
import '../classes/customer.dart';
import '../classes/individual.dart';
import '../classes/family.dart';
import '../classes/group.dart';
import 'form_sections/common_fields.dart';
import 'form_sections/individual_fields.dart';
import 'form_sections/family_fields.dart';
import 'form_sections/group_fields.dart';

class BookingForm extends StatefulWidget {
  final Function(Customer) onAddCustomer;

  const BookingForm({
    Key? key,
    required this.onAddCustomer,
  }) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCustomerType;
  
  // Common form controllers
  final destinationController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final contactNameController = TextEditingController();
  final priceController = TextEditingController();
  
  // Individual specific controllers
  final insuranceNumberController = TextEditingController();
  final workPlaceController = TextEditingController();
  final homeAddressController = TextEditingController();
  
  // Family specific controllers
  final primaryContactController = TextEditingController();
  final insuranceCompanyController = TextEditingController();
  final remainingFamilyMemberController = TextEditingController();
  
  // Group specific controllers
  final groupInsuranceController = TextEditingController();
  final organizingHardwareController = TextEditingController();
  final acceptingCompanyController = TextEditingController();

  void _resetForm() {
    setState(() {
      selectedCustomerType = null;
      destinationController.clear();
      phoneController.clear();
      emailController.clear();
      contactNameController.clear();
      priceController.clear();
      
      insuranceNumberController.clear();
      workPlaceController.clear();
      homeAddressController.clear();
      
      primaryContactController.clear();
      insuranceCompanyController.clear();
      remainingFamilyMemberController.clear();
      
      groupInsuranceController.clear();
      organizingHardwareController.clear();
      acceptingCompanyController.clear();
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final destination = destinationController.text.toLowerCase();
      final phone = phoneController.text;
      final contactName = contactNameController.text.toLowerCase();
      final email = emailController.text.toLowerCase();
      final tripPrice = double.parse(priceController.text);

      Customer customer;

      switch (selectedCustomerType) {
        case 'Individual':
          customer = Individual(
            destination,
            phone,
            contactName,
            tripPrice,
            insuranceNumberController.text.toLowerCase(),
            workPlaceController.text.toLowerCase(),
          );
          (customer as Individual).homeAddress = homeAddressController.text.toLowerCase();
          break;
        case 'Family':
          customer = Family(
            destination,
            phone,
            contactName,
            tripPrice,
            insuranceCompanyController.text.toLowerCase(),
            remainingFamilyMemberController.text.toLowerCase(),
          );
          (customer as Family).primaryContact = primaryContactController.text.toLowerCase();
          break;
        case 'Group':
          customer = Group(
            destination,
            phone,
            contactName,
            tripPrice,
            organizingHardwareController.text.toLowerCase(),
            acceptingCompanyController.text.toLowerCase(),
          );
          (customer as Group).groupInsurance = groupInsuranceController.text.toLowerCase();
          break;
        default:
          // Should never happen due to validation
          return;
      }

      // Add email to customer
      customer.email = email;
      
      widget.onAddCustomer(customer);
      _resetForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '✨ Welcome to our Travel Booking Agency! ✨',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'We\'re here to make your journey smooth and hassle-free.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            
            // Customer Type Selection
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Customer Type',
                border: OutlineInputBorder(),
                helperText: 'Select the type of customer',
              ),
              value: selectedCustomerType,
              items: ['Individual', 'Family', 'Group']
                  .map((label) => DropdownMenuItem(
                        value: label,
                        child: Text(label),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCustomerType = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a customer type';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            
            // Common Fields Section
            CommonFields(
              destinationController: destinationController,
              phoneController: phoneController,
              emailController: emailController,
              contactNameController: contactNameController,
              priceController: priceController,
            ),
            
            // Conditional type-specific fields
            if (selectedCustomerType != null) ...[
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '$selectedCustomerType Information',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              
              if (selectedCustomerType == 'Individual')
                IndividualFields(
                  homeAddressController: homeAddressController,
                  insuranceNumberController: insuranceNumberController,
                  workPlaceController: workPlaceController,
                ),
              
              if (selectedCustomerType == 'Family')
                FamilyFields(
                  primaryContactController: primaryContactController,
                  insuranceCompanyController: insuranceCompanyController,
                  remainingFamilyMemberController: remainingFamilyMemberController,
                ),
              
              if (selectedCustomerType == 'Group')
                GroupFields(
                  groupInsuranceController: groupInsuranceController,
                  organizingHardwareController: organizingHardwareController,
                  acceptingCompanyController: acceptingCompanyController,
                ),
            ],
            
            const SizedBox(height: 24),
            
            Center(
              child: ElevatedButton(
                onPressed: selectedCustomerType == null ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Book Trip',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    // Dispose all controllers to prevent memory leaks
    destinationController.dispose();
    phoneController.dispose();
    emailController.dispose();
    contactNameController.dispose();
    priceController.dispose();
    
    insuranceNumberController.dispose();
    workPlaceController.dispose();
    homeAddressController.dispose();
    
    primaryContactController.dispose();
    insuranceCompanyController.dispose();
    remainingFamilyMemberController.dispose();
    
    groupInsuranceController.dispose();
    organizingHardwareController.dispose();
    acceptingCompanyController.dispose();
    
    super.dispose();
  }
}