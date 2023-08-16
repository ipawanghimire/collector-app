import 'package:flutter/material.dart';
import 'package:hoeizon_app/screen/add_user/add_user.dart';
import 'package:hoeizon_app/screen/collection/todays_collection.dart';
import 'package:hoeizon_app/screen/deposit/deposit_screen.dart';
import 'package:hoeizon_app/screen/loan/loan_screen.dart';
import 'package:hoeizon_app/screen/widget/card_widget.dart';
import 'package:hoeizon_app/screen/widget/list_card.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const DrawerContent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 46).copyWith(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 46),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(top: 20, bottom: 10),
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DepositPage()),
                    );
                  },
                  child: const CardWidget(
                    title: "Deposits Collection",
                    amount: "Rs. 23,500",
                    secondaryText: "Remaining deposits: 50",
                    cardColor: Colors.orange,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoanPage()),
                    );
                  },
                  child: const CardWidget(
                    title: "Loans Collection",
                    amount: "Rs. 35,500",
                    secondaryText: "Number of collected loans: 50",
                    cardColor: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CollectionPage()),
                    );
                  },
                  child: const CardWidget(
                    title: "Today's Collection",
                    amount: "Rs. 63,300",
                    secondaryText: "Number of deposits: 50",
                    cardColor: Colors.green,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddUserPage()),
                    );
                  },
                  child: const CardWidget(
                    title: "Member Registration",
                    amount: "",
                    secondaryText: "Add a new member",
                    cardColor: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListViewBuilderTable(),
          ],
        ),
      ),
    );
  }
}
