import 'package:flutter/material.dart';

class DepositTab extends StatelessWidget {
  const DepositTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      child: const Center(child: Text("Todays deposit")),
    );
  }
}
