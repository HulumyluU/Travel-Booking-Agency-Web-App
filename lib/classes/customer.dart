class Customer {
  String destination;
  String phone;
  String contactName;
  double tripPrice;
  String email = ""; // added for ass 2

  Customer(this.destination, this.phone, this.contactName, this.tripPrice);
  @override
  String toString() {
    return '''Booking Summary:
  Destination: $destination
  Phone: $phone
  Contact Name: $contactName
  Email: $email
  Trip Price: \$${tripPrice.toInt()}''';
  }
}

