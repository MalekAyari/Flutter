import 'package:flutter/material.dart';

class OrderBook extends StatelessWidget {
  final List<Map<String, dynamic>> buyOrders = [
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    // Add more orders as needed
  ];

  final List<Map<String, dynamic>> sellOrders = [
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    {'price': 10.2, 'volume': 50},
    {'price': 10.3, 'volume': 75},
    {'price': 10.4, 'volume': 30},
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      body: Center(
          child: Container(
            height: 650,
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Buy Orders',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFFB1E457)),
                        ),
                        const SizedBox(height: 10),
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Price', style: TextStyle(fontSize: 16, color: Colors.white))),
                            DataColumn(label: Text('Volume', style: TextStyle(fontSize: 16, color: Colors.white))),
                          ],
                          rows: buyOrders
                              .map((order) => DataRow(cells: [
                            DataCell(Text(order['price'].toString(), style: TextStyle(color: Colors.white))),
                            DataCell(Text(order['volume'].toString(), style: TextStyle(color: Colors.white))),
                          ]))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),

                const VerticalDivider(width: 20, color: Colors.grey),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Text(
                          'Sell Orders',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFFB1E457)),
                        ),
                        const SizedBox(height: 10),
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Price', style: TextStyle(fontSize: 16, color: Colors.white))),
                            DataColumn(label: Text('Volume', style: TextStyle(fontSize: 16, color: Colors.white))),
                          ],
                          rows: sellOrders
                              .map((order) => DataRow(cells: [
                            DataCell(Text(order['price'].toString(), style: TextStyle(color: Colors.white))),
                            DataCell(Text(order['volume'].toString(), style: TextStyle(color: Colors.white))),
                          ]))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      )
    );
  }
}
