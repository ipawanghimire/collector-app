import 'package:flutter/material.dart';
import 'package:hoeizon_app/dp_helper/database.dart';
import 'package:hoeizon_app/model/collection_model.dart';
import 'package:hoeizon_app/provider/provider.dart';
import 'package:hoeizon_app/screen/bottom_nav.dart';

import 'package:hoeizon_app/screen/widget/text_form_field.dart';
import 'package:provider/provider.dart';

class LoanPage extends StatelessWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController accountNumber = TextEditingController();
    TextEditingController accountName = TextEditingController();
    TextEditingController amount = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Details'),
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
                'Loan Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ReusableTextFormField(
                label: 'Account Number',
                textColor: Colors.black,
                controller: accountNumber,
                underlineColor: Colors.black,
              ),
              const SizedBox(height: 12),
              ReusableTextFormField(
                label: 'A/c Holder\'s Name',
                textColor: Colors.black,
                controller: accountName,
                underlineColor: Colors.black,
              ),
              const SizedBox(height: 12),
              ReusableTextFormField(
                label: 'Amount Reveiced',
                textColor: Colors.black,
                controller: amount,
                keyboardType: TextInputType.number,
                underlineColor: Colors.black,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final deposit = Collection(
                        accountNumber: accountNumber.text,
                        accountName: accountName.text,
                        amount: double.parse(amount.text),
                        type: 'Loan',
                      );
                      await DatabaseHelper.instance.insertDeposit(deposit);
                      final loanProvider = Provider.of<CollectionProvider>(
                          context,
                          listen: false);
                      loanProvider.addToTotalLoan(double.parse(amount.text));
                      loanProvider.addNoLoan();

                      final totalProvider = Provider.of<CollectionProvider>(
                          context,
                          listen: false);

                      totalProvider.addToTotalTodaysCollection();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Deposit saved successfully'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavigation()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(120, 48),
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
