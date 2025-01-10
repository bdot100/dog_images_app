import 'package:flutter/material.dart';

class BreedDropdown extends StatelessWidget {
  const BreedDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    // This should be populated with actual breeds from the API
    final breeds = ['bulldog', 'labrador', 'poodle'];

    return DropdownButton<String>(
      hint: Text('Select Breed'),
      onChanged: (String? newValue) {
        // Handle breed selection
      },
      items: breeds.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
