import 'package:flutter/material.dart';
import 'package:hoeizon_app/screen/deposit/deposit_screen.dart';
import 'package:hoeizon_app/screen/home/home_screen.dart';
import 'package:hoeizon_app/screen/loan/loan_screen.dart';
import 'package:hoeizon_app/screen/widget/qr_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final List<Widget> _pages = [
    HomePage(),
    QRPage(),
    const DepositPage(),
    const LoanPage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        elevation: 4,
        fixedColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
              color: Colors.black,
            ),
            label: 'QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.attach_money,
              color: Colors.black,
            ),
            label: 'Deposit',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: 'Loan',
          ),
        ],
      ),
    );
  }
}
