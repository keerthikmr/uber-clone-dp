import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uber_clone/features/driver/presentation/providers/driver_registration_provider.dart';

class DriverRegistrationScreen extends ConsumerStatefulWidget {
  const DriverRegistrationScreen({super.key});

  @override
  ConsumerState<DriverRegistrationScreen> createState() =>
      _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState
    extends ConsumerState<DriverRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _licenseController = TextEditingController();
  final _vehicleModelController = TextEditingController();
  final _vehicleNumberController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();

  DateTime? _dateOfBirth;
  DateTime? _licenseExpiryDate;
  DateTime? _insuranceExpiryDate;
  String _selectedGender = 'Male';
  String _selectedVehicleType = 'Sedan';
  File? _profilePhoto;
  File? _licensePhoto;
  File? _insurancePhoto;

  final _vehicleTypes = ['Sedan', 'SUV', 'Van', 'Hatchback'];
  final _genders = ['Male', 'Female', 'Other'];

  Future<void> _pickImage(
      ImageSource source, void Function(File) onPicked) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image != null) {
        onPicked(File(image.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
    }
  }

  Future<void> _selectDate(
    BuildContext context,
    void Function(DateTime) onSelected, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1950),
      lastDate: lastDate ?? DateTime(2101),
    );
    if (picked != null) {
      onSelected(picked);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _licenseController.dispose();
    _vehicleModelController.dispose();
    _vehicleNumberController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registrationState = ref.watch(driverRegistrationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register as Driver'),
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (registrationState.error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      registrationState.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                _buildImagePicker(
                  'Profile Photo',
                  _profilePhoto,
                  (file) => setState(() => _profilePhoto = file),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value?.isEmpty == true ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildDatePicker(
                        'Date of Birth',
                        _dateOfBirth,
                        (date) => setState(() => _dateOfBirth = date),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          border: OutlineInputBorder(),
                        ),
                        items: _genders
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedGender = value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _licenseController,
                        decoration: const InputDecoration(
                          labelText: 'License Number',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDatePicker(
                        'License Expiry',
                        _licenseExpiryDate,
                        (date) => setState(() => _licenseExpiryDate = date),
                        firstDate: DateTime.now(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildImagePicker(
                  'License Photo',
                  _licensePhoto,
                  (file) => setState(() => _licensePhoto = file),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedVehicleType,
                        decoration: const InputDecoration(
                          labelText: 'Vehicle Type',
                          border: OutlineInputBorder(),
                        ),
                        items: _vehicleTypes
                            .map((type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() => _selectedVehicleType = value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _vehicleNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Vehicle Number',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildDatePicker(
                        'Insurance Expiry',
                        _insuranceExpiryDate,
                        (date) => setState(() => _insuranceExpiryDate = date),
                        firstDate: DateTime.now(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildImagePicker(
                        'Insurance Photo',
                        _insurancePhoto,
                        (file) => setState(() => _insurancePhoto = file),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _streetController,
                  decoration: const InputDecoration(
                    labelText: 'Street Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value?.isEmpty == true ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _cityController,
                        decoration: const InputDecoration(
                          labelText: 'City',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _stateController,
                        decoration: const InputDecoration(
                          labelText: 'State',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _zipController,
                        decoration: const InputDecoration(
                          labelText: 'ZIP Code',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            value?.isEmpty == true ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: registrationState.isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            print('Form validated, attempting registration...');
                            try {
                              final details = DriverDetails(
                                id: '', // Will be set by Supabase
                                fullName: _nameController.text,
                                phoneNumber: _phoneController.text,
                                email: _emailController.text,
                                dateOfBirth: _dateOfBirth,
                                gender: _selectedGender,
                                licenseNumber: _licenseController.text,
                                licenseExpiryDate: _licenseExpiryDate,
                                vehicleType: _selectedVehicleType,
                                vehicleRegistrationNumber:
                                    _vehicleNumberController.text,
                                vehicleInsuranceExpiry: _insuranceExpiryDate,
                                streetAddress: _streetController.text,
                                city: _cityController.text,
                                state: _stateController.text,
                                zipCode: _zipController.text,
                                profilePhotoUrl: '',
                                licensePhotoUrl: '',
                                insurancePhotoUrl: '',
                              );

                              await ref
                                  .read(driverRegistrationProvider.notifier)
                                  .registerDriver(details);

                              if (mounted) {
                                if (registrationState.error != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(registrationState.error!),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Registration successful!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                              }
                            } catch (e) {
                              print('Error in registration button: $e');
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Error: ${e.toString()}'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          }
                        },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
          if (registrationState.isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDatePicker(
    String label,
    DateTime? value,
    void Function(DateTime) onPicked, {
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    return InkWell(
      onTap: () => _selectDate(
        context,
        onPicked,
        initialDate: value,
        firstDate: firstDate,
        lastDate: lastDate,
      ),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value != null
                  ? DateFormat('MMM dd, yyyy').format(value)
                  : 'Select',
              style: value == null
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey)
                  : null,
            ),
            const Icon(Icons.calendar_today, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePicker(
    String label,
    File? image,
    void Function(File) onPicked,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Take Photo'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera, onPicked);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Choose from Gallery'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery, onPicked);
                    },
                  ),
                ],
              ),
            ),
          ),
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                : const Center(
                    child: Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
