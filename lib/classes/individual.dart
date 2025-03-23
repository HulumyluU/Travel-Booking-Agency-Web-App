import 'customer.dart';

class Individual extends Customer {
  String insuranceNumber;
  String workPlace;
  String homeAddress = ""; // Added for ass 2

  Individual(super.destination, super.phone, super.contactName,
      super.tripPrice, this.insuranceNumber, this.workPlace);

  @override
  String toString() {
    return 
    '''${super.toString()}
  Travel Insurance: $insuranceNumber
  Workplace: $workPlace${homeAddress.isNotEmpty ? '\nHome Address: $homeAddress' : ''}''';
  }
}


