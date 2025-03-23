import 'customer.dart';

class Family extends Customer {
  String insuranceCompany;
  String remainingFamilyMember;
  String primaryContact = ""; // Added for ass2

  Family(super.destination, super.phone, super.contactName, super.tripPrice,
      this.insuranceCompany, this.remainingFamilyMember);

  @override
  String toString() {
    return '''${super.toString()}
  Family Health Insurance: $insuranceCompany
  Remaining Family Member in Canada: $remainingFamilyMember${primaryContact.isNotEmpty ? '\nPrimary Contact: $primaryContact' : ''}''';
  }
}
