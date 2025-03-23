# assignment_2 

## Project Overivew

This application is a web-based version of a console application, maintaining the same class structure but with a modern UI. The app allows travel agents to:

Create bookings for three types of customers (Individual, Family, Group)
Collect specific information for each customer type
Display all bookings with a summary of total price
Switch between booking form and bookings list views

## Project Structure

lib/
├── BookingScreen.dart                  # Main screen container
├── main.dart                           # Application entry point
├── classes/                            # Model classes
│   ├── customer.dart                   # Base customer class
│   ├── individual.dart                 # Individual customer type
│   ├── family.dart                     # Family customer type
│   └── group.dart                      # Group customer type
└── components/                         # UI components
    ├── booking_form.dart               # Form container
    ├── bookings_list.dart              # Bookings list container
    ├── customer_card.dart              # Customer info card
    ├── summary_card.dart               # Booking summary card
    └── form_sections/                  # Form field groups
        ├── common_fields.dart          # Common form fields
        ├── individual_fields.dart      # Individual-specific fields
        ├── family_fields.dart          # Family-specific fields
        └── group_fields.dart           # Group-specific fields


## Getting Started

Prerequisites

Flutter SDK (latest stable version)
Dart SDK (latest stable version)
A web browser (Chrome recommended for development)

 - flutter pub get // get dependencies
 - flutter run -d chrome // run the project