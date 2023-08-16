import 'dart:io';
import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hoeizon_app/screen/widget/text_form_field.dart';

class AddUserPage extends StatefulWidget {
  AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _membershipNoController = TextEditingController();

  final TextEditingController _membershipNameController =
      TextEditingController();

  final TextEditingController _occupationController = TextEditingController();

  final TextEditingController _fatherMotherNameController =
      TextEditingController();

  final TextEditingController _grandFatherNameController =
      TextEditingController();

  final TextEditingController _permanentAddressController =
      TextEditingController();

  final TextEditingController _recentlyAddressController =
      TextEditingController();

  final TextEditingController _contactNoController = TextEditingController();

  final TextEditingController _citizenshipNoController =
      TextEditingController();

  final TextEditingController _emailIdController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();

  final TextEditingController enteredbycontroller = TextEditingController();

  String? _selectedGender;

  String? _selectedMaritalStatus;

  String? _selectedNationality;

  String? _selectedReligion;

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];

  final List<String> _maritalStatusOptions = [
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];

  final List<String> _nationalityOptions = [
    'Nepali',
    'Indian',
    'American',
    'Other'
  ];

  final List<String> _religionOptions = [
    'Hindu',
    'Christian',
    'Muslim',
    'Buddhist',
    'Other'
  ];
  List<File> _selectedImages = [];

  Future<void> _pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _selectedImages.add(File(image.path));
      });
      print('Image captured: ${_selectedImages.last.path}');
    }
  }

  Widget _buildImagePreview() {
    if (_selectedImages.isEmpty) {
      return const Text('No images captured');
    } else {
      return Center(
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _selectedImages.map((image) {
            return Image.file(
              image,
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
            );
          }).toList(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                ReusableTextFormField(
                    label: 'Membership No',
                    controller: _membershipNoController,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Membership Name',
                    controller: _membershipNameController,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Occupation (Job)',
                    controller: _occupationController,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Father/Mother Name',
                    controller: _fatherMotherNameController,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Grand Father Name',
                    controller: _grandFatherNameController,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Permanent Address',
                    controller: _permanentAddressController,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Recently Address',
                    controller: _recentlyAddressController,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ReusableTextFormField(
                          label: 'Contact No',
                          controller: _contactNoController,
                          keyboardType: TextInputType.phone,
                          underlineColor: Colors.black87,
                          textColor: Colors.black,
                          validator: (value) {
                            if (value == null) {
                              return '*required';
                            }
                          }),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: ReusableTextFormField(
                          label: 'Citizenship No',
                          controller: _citizenshipNoController,
                          underlineColor: Colors.black87,
                          textColor: Colors.black,
                          validator: (value) {
                            if (value == null) {
                              return '*required';
                            }
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Email ID',
                    controller: _emailIdController,
                    keyboardType: TextInputType.emailAddress,
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        value: _selectedGender,
                        onChanged: (value) {
                          _selectedGender = value;
                        },
                        items: _genderOptions.map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                        hint: const Text('Select Gender'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: ReusableTextFormField(
                          label: 'Date of Birth',
                          controller: _dobController,
                          keyboardType: TextInputType.datetime,
                          underlineColor: Colors.black87,
                          textColor: Colors.black,
                          validator: (value) {
                            if (value == null) {
                              return '*required';
                            }
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        value: _selectedMaritalStatus,
                        onChanged: (value) {
                          _selectedMaritalStatus = value;
                        },
                        items: _maritalStatusOptions.map((status) {
                          return DropdownMenuItem<String>(
                            value: status,
                            child: Text(status),
                          );
                        }).toList(),
                        hint: const Text('Select Marital Status'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<String>(
                        value: _selectedNationality,
                        onChanged: (value) {
                          _selectedNationality = value;
                        },
                        items: _nationalityOptions.map((nationality) {
                          return DropdownMenuItem<String>(
                            value: nationality,
                            child: Text(nationality),
                          );
                        }).toList(),
                        hint: const Text('Select Nationality'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedReligion,
                  onChanged: (value) {
                    _selectedReligion = value;
                  },
                  items: _religionOptions.map((religion) {
                    return DropdownMenuItem<String>(
                      value: religion,
                      child: Text(religion),
                    );
                  }).toList(),
                  hint: const Text('Select Religion'),
                ),
                const SizedBox(height: 16),
                ReusableTextFormField(
                    label: 'Entered By',
                    underlineColor: Colors.black87,
                    textColor: Colors.black,
                    controller: enteredbycontroller,
                    validator: (value) {
                      if (value == null) {
                        return '*required';
                      }
                    }),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _pickImageFromCamera,
                  child: const Text('Capture Image'),
                ),
                SizedBox(
                  height: 16,
                ),
                _buildImagePreview(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text('Add User'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
