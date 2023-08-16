import 'package:flutter/material.dart';
import 'package:hoeizon_app/screen/collection/deposit_tab.dart';
import 'package:hoeizon_app/screen/collection/loan_tab.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Deposit'),
            Tab(text: 'Loan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          DepositTab(),
          LoanTab(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
