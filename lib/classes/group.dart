import 'customer.dart';

class Group extends Customer {
  String organizingHardware;
  String acceptingCompany;
  String groupInsurance = ""; // Added for ass 2

  Group(super.destination, super.phone, super.contactName, super.tripPrice,
      this.organizingHardware, this.acceptingCompany);

  @override
  String toString() {
    return '''${super.toString()}
  Organizing Hardware: $organizingHardware
  Destination Company: $acceptingCompany${groupInsurance.isNotEmpty ? '\nGroup Insurance Number: $groupInsurance' : ''}
''';
  }
}