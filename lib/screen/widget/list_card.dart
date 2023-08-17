import 'dart:async';

import 'package:flutter/material.dart';

class ListViewBuilderTable extends StatelessWidget {
  final List<Map<String, dynamic>> listViewItems;

  const ListViewBuilderTable({Key? key, required this.listViewItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (listViewItems.isEmpty) {
      return const Center(
        child: Text(
          'No recent collections for today.',
          style: TextStyle(fontSize: 18),
        ),
      );
    } else {
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

              final name =
                  item['accountName'] ?? ''; // Provide default value for name
              final amount = item['amount']?.toString() ??
                  ''; // Provide default value for amount
              final type = item['type'] ?? ''; // Provide default value for type

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
                            (index + 1).toString(),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            amount,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            type,
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
}
