import 'package:flutter/material.dart';

class OrderBook extends StatefulWidget {
  @override
  _OrderBookState createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  bool isBuySelected = true;
  final List<Map<String, dynamic>> buyOrders = [
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},

  ];
  final List<Map<String, dynamic>> sellOrders = [
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.4, 'volume': 30, 'id': 3},
    {'price': 10.2, 'volume': 50, 'id': 1},
    {'price': 10.3, 'volume': 75, 'id': 2},
    {'price': 10.4, 'volume': 30, 'id': 3},
    // Add more orders as needed
  ];

  final Map<int, String> currencyMap = {
    1: 'BTC',
    2: 'ETH',
    3: 'LTC',
  };

  final Map<int, IconData> currencyIcons = {
    1: Icons.monetization_on, // Placeholder icon for BTC
    2: Icons.attach_money,    // Placeholder icon for ETH
    3: Icons.euro_symbol,     // Placeholder icon for LTC
  };

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> displayedOrders = isBuySelected ? buyOrders : sellOrders;

    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      appBar: AppBar(
        title: const Text("Order Book"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // ToggleButtons for Buy and Sell
          Center(
            child: ToggleButtons(
              isSelected: [isBuySelected, !isBuySelected],
              selectedColor: Colors.black,
              fillColor: Color(0xFFB1E457),
              borderRadius: BorderRadius.circular(10),
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Buy Orders',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Sell Orders',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  isBuySelected = index == 0;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          // Display data table based on selected tab
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID', style: TextStyle(fontSize: 16, color: Colors.white))),
                  DataColumn(label: Text('Price', style: TextStyle(fontSize: 16, color: Colors.white))),
                  DataColumn(label: Text('Vol', style: TextStyle(fontSize: 16, color: Colors.white))),
                ],
                rows: displayedOrders
                    .map((order) => DataRow(cells: [
                  DataCell(Text(order['id'].toString(), style: const TextStyle(color: Colors.white))),
                  DataCell(Text(order['price'].toString(), style: const TextStyle(color: Colors.white))),
                  DataCell(Text(order['volume'].toString(), style: const TextStyle(color: Colors.white))),
                ]))
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Bottom buttons for new buy/sell orders
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _showNewOrderModal(context, isBuyOrder: true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB1E457),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      "New Buy Order",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _showNewOrderModal(context, isBuyOrder: false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB1E457),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    child: const Text(
                      "New Sell Order",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Show modal to create new order
  void _showNewOrderModal(BuildContext context, {required bool isBuyOrder}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFB1E457),
      builder: (BuildContext context) {
        int selectedCurrencyId = 1; // Default currency ID (e.g., BTC)
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isBuyOrder ? "Create New Buy Order" : "Create New Sell Order",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF212936)),
              ),
              // Rest of modal form...
            ],
          ),
        );
      },
    );
  }
}
