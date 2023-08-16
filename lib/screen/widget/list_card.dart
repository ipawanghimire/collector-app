import 'package:flutter/material.dart';

class ListViewBuilderTable extends StatelessWidget {
  final List<Map<String, String>> listViewItems = [
    {'sn': '1', 'name': 'John Doe', 'amount': 'Rs. 1000', 'type': 'Deposit'},
    {'sn': '2', 'name': 'Jane Smith', 'amount': 'Rs. 1500', 'type': 'Deposit'},
    {'sn': '3', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '4', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '5', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '6', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '7', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '8', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '9', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '10', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    {'sn': '11', 'name': 'Alice Johnson', 'amount': 'Rs. 2000', 'type': 'Loan'},
    // Add more items as needed
  ];

  ListViewBuilderTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  'SN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Amount',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Type',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 10, thickness: 2),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listViewItems.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = listViewItems[index];
            final isEvenRow = index.isEven;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isEvenRow ? Colors.grey[200] : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          item['sn']!,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item['name']!,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item['amount']!,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          item['type']!,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
