import 'package:flutter/material.dart';

class LoanTab extends StatelessWidget {
  const LoanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.greenAccent),
      child: const Center(child: Text("Todays Loan Collection")),
    );
  }
}
