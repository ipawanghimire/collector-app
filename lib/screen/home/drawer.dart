import 'package:flutter/material.dart';

import 'package:hoeizon_app/screen/bottom_nav.dart';
import 'package:hoeizon_app/screen/collection/todays_collection.dart';
import 'package:hoeizon_app/screen/export/export_screen.dart';
import 'package:hoeizon_app/screen/import/import_screen.dart';
import 'package:hoeizon_app/screen/login_page.dart';
import 'package:hoeizon_app/screen/deposit/deposit_screen.dart';
import 'package:hoeizon_app/screen/widget/drawer_item.dart';
import 'package:hoeizon_app/screen/loan/loan_screen.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/logo.jpeg"),
                    radius: 32,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' XYZ Cooperative name'),
                      Text(" ABC user"),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                DrawerItem(
                  icon: Icons.dashboard,
                  title: "Dashboard",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigation()),
                    );
                  },
                ),
                DrawerItem(
                  icon: Icons.person_add,
                  title: "Deposit Collection",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DepositPage()),
                    );
                  },
                ),
                DrawerItem(
                  icon: Icons.person,
                  title: "Loan Collection",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoanPage()),
                    );
                  },
                ),
                DrawerItem(
                  icon: Icons.comment_bank,
                  title: "Today Collection",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CollectionPage()),
                    );
                  },
                ),
                DrawerItem(
                  icon: Icons.dataset_linked,
                  title: "Import Data",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImportPage()),
                    );
                  },
                ),
                DrawerItem(
                  icon: Icons.dataset_outlined,
                  title: "Export Data",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ExportPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, elevation: 5),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
