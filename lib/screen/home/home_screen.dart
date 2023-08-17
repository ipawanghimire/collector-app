import 'package:flutter/material.dart';
import 'package:hoeizon_app/dp_helper/database.dart';
import 'package:hoeizon_app/model/collection_model.dart';
import 'package:hoeizon_app/provider/provider.dart';
import 'package:hoeizon_app/screen/add_user/add_user.dart';
import 'package:hoeizon_app/screen/collection/todays_collection.dart';
import 'package:hoeizon_app/screen/deposit/deposit_screen.dart';
import 'package:hoeizon_app/screen/loan/loan_screen.dart';
import 'package:hoeizon_app/screen/widget/card_widget.dart';
import 'package:hoeizon_app/screen/widget/list_card.dart';
import 'package:provider/provider.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> dataFromTable = [];

  Future<void> fetchDataFromDatabase() async {
    List<Collection> dbData = await DatabaseHelper.instance.getAllCollections();

    setState(() {
      dataFromTable =
          dbData.reversed.map((collection) => collection.toMap()).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      drawer: const DrawerContent(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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
              childAspectRatio: 1.89,
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
                  child: Consumer<CollectionProvider>(
                    builder: (context, depositProvider, _) {
                      String depositAmountText =
                          "Rs. ${depositProvider.totalDeposit.toStringAsFixed(2)}";
                      return CardWidget(
                        title: "Deposits Collection",
                        amount: depositAmountText,
                        secondaryText:
                            "Deposit Collected: ${depositProvider.noDeposit}",
                        cardColor: Colors.orange,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoanPage()),
                    );
                  },
                  child: Consumer<CollectionProvider>(
                    builder: (context, collectionProvider, _) {
                      String loanAmountText =
                          "Rs. ${collectionProvider.totalLoan.toStringAsFixed(2)}";
                      return CardWidget(
                        title: "Loan Collection",
                        amount: loanAmountText,
                        secondaryText:
                            "Loan Collected: ${collectionProvider.noloan}",
                        cardColor: Colors.red,
                      );
                    },
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
                  child: Consumer<CollectionProvider>(
                    builder: (context, collectionProvider, _) {
                      String totalAmountText =
                          "Rs. ${collectionProvider.todaysCollection.toStringAsFixed(2)}";
                      String noTotal = (collectionProvider.noloan +
                              collectionProvider.noDeposit)
                          .toString();
                      return CardWidget(
                        title: "Total Collection",
                        amount: totalAmountText,
                        secondaryText: "Total Collected : $noTotal",
                        cardColor: Colors.green,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddUserPage()),
                    );
                  },
                  child: CardWidget(
                    title: "Member Registration",
                    amount: "",
                    secondaryText: "Add a new member",
                    cardColor: Colors.blue,
                    icon: Icons.person_add, // Provide the icon
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListViewBuilderTable(
              listViewItems: dataFromTable,
            ),
          ],
        ),
      ),
    );
  }
}
