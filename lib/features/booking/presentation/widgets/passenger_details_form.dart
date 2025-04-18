import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uber_clone/core/theme/app_theme.dart';

class PassengerDetailsForm extends StatefulWidget {
  final int totalSeats;
  final Function(List<Map<String, dynamic>> passengersList) onPassengersUpdated;

  const PassengerDetailsForm({
    Key? key,
    required this.totalSeats,
    required this.onPassengersUpdated,
  }) : super(key: key);

  @override
  State<PassengerDetailsForm> createState() => _PassengerDetailsFormState();
}

class _PassengerDetailsFormState extends State<PassengerDetailsForm> {
  final List<Map<String, dynamic>> _passengers = [];
  final List<GlobalKey<FormState>> _formKeys = [];
  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  void initState() {
    super.initState();
    // Initialize with empty passengers based on total seats
    for (int i = 0; i < widget.totalSeats; i++) {
      _passengers.add({
        'fullName': '',
        'age': '',
        'gender': 'Male',
      });
      _formKeys.add(GlobalKey<FormState>());
    }
  }

  void _updatePassenger(int index, String field, dynamic value) {
    setState(() {
      _passengers[index][field] = value;
      widget.onPassengersUpdated(_passengers);
    });
  }

  bool validateAllForms() {
    bool allValid = true;
    for (var key in _formKeys) {
      if (!(key.currentState?.validate() ?? false)) {
        allValid = false;
      }
    }
    return allValid;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Passenger Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(
          widget.totalSeats,
          (index) => _buildPassengerForm(index),
        ),
      ],
    );
  }

  Widget _buildPassengerForm(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKeys[index],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Passenger ${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter passenger name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter passenger name';
                  }
                  return null;
                },
                onChanged: (value) => _updatePassenger(index, 'fullName', value),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Age',
                  hintText: 'Enter passenger age',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter passenger age';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age <= 0 || age > 120) {
                    return 'Please enter a valid age';
                  }
                  return null;
                },
                onChanged: (value) => _updatePassenger(index, 'age', value),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Gender',
                ),
                value: _passengers[index]['gender'],
                items: _genders.map((gender) {
                  return DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    _updatePassenger(index, 'gender', value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
