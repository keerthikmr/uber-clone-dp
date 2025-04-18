import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uber_clone/features/ride/domain/models/ride_details.dart';
import 'package:uber_clone/core/config/supabase_config.dart';
import 'package:uber_clone/features/ride/data/providers/ride_provider.dart';

class StartRideScreen extends ConsumerStatefulWidget {
  const StartRideScreen({super.key});

  @override
  ConsumerState<StartRideScreen> createState() => _StartRideScreenState();
}

class _StartRideScreenState extends ConsumerState<StartRideScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fromLocationController = TextEditingController();
  final _toLocationController = TextEditingController();
  final _availableSeatsController = TextEditingController();
  final _pricePerSeatController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _startTime = DateTime.now().add(const Duration(hours: 1));
  int _estimatedDuration = 30; // Default 30 minutes

  @override
  void dispose() {
    _fromLocationController.dispose();
    _toLocationController.dispose();
    _availableSeatsController.dispose();
    _pricePerSeatController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectStartTime() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_startTime),
      );
      if (time != null) {
        setState(() {
          _startTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _createRide() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final currentUser = SupabaseConfig.client.auth.currentUser;
      if (currentUser == null || currentUser.id.isEmpty) {
        throw Exception('No authenticated user found');
      }

      final ride = RideDetails(
        driverId: currentUser.id,
        fromLocation: _fromLocationController.text,
        toLocation: _toLocationController.text,
        availableSeats: int.parse(_availableSeatsController.text),
        startTime: _startTime,
        estimatedDuration: _estimatedDuration,
        pricePerSeat: double.parse(_pricePerSeatController.text),
        notes: _notesController.text.isNotEmpty ? _notesController.text : null,
      );

      await ref.read(rideServiceProvider).createRide(ride);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ride created successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating ride: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start a Ride'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _fromLocationController,
                decoration: const InputDecoration(
                  labelText: 'From Location',
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter starting location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _toLocationController,
                decoration: const InputDecoration(
                  labelText: 'To Location',
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter destination';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _availableSeatsController,
                decoration: const InputDecoration(
                  labelText: 'Available Seats',
                  prefixIcon: Icon(Icons.people),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of seats';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Start Time'),
                subtitle: Text(
                  '${_startTime.day}/${_startTime.month}/${_startTime.year} ${_startTime.hour}:${_startTime.minute.toString().padLeft(2, '0')}',
                ),
                onTap: _selectStartTime,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _estimatedDuration,
                decoration: const InputDecoration(
                  labelText: 'Estimated Duration (minutes)',
                  prefixIcon: Icon(Icons.timer),
                ),
                items: [15, 30, 45, 60, 90, 120]
                    .map((duration) => DropdownMenuItem(
                          value: duration,
                          child: Text('$duration minutes'),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _estimatedDuration = value;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _pricePerSeatController,
                decoration: const InputDecoration(
                  labelText: 'Price per Seat',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price per seat';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(
                  labelText: 'Notes (Optional)',
                  prefixIcon: Icon(Icons.note),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _createRide,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Create Ride'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
