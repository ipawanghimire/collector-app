import 'package:flutter/material.dart';
import 'package:hoeizon_app/screen/bottom_nav.dart';

import 'package:hoeizon_app/screen/widget/text_form_field.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController accountNumber = TextEditingController();
    TextEditingController accountName = TextEditingController();
    TextEditingController amount = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavigation()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Deposit Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ReusableTextFormField(
                label: 'Account Number',
                textColor: Colors.black,
                controller: accountNumber, // Provide your controller
                underlineColor: Colors.black, // Set keyboard type
              ),
              const SizedBox(height: 12),
              ReusableTextFormField(
                label: 'A/c Holder\'s Name',
                textColor: Colors.black,
                controller: accountName, // Provide your controller
                underlineColor: Colors.black, // Set keyboard type
              ),
              const SizedBox(height: 12),
              ReusableTextFormField(
                label: 'Reveived Amt',
                textColor: Colors.black,
                controller: amount,
                keyboardType: TextInputType.number,
                underlineColor: Colors.black, // Provide your controller
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(120, 48), // Set the minimum size
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavigation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(120, 48), // Set the minimum size
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
