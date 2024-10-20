import 'package:flutter/material.dart';

class OrderBook extends StatelessWidget {
  final List<Map<String, dynamic>> buyOrders = [
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
    // Add more orders as needed
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
    return Scaffold(
        backgroundColor: const Color(0xFF212936),

        body: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 650,
              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'Buy Orders',
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFB1E457)),
                          ),
                          const SizedBox(height: 10),
                          DataTable(
                            columns: const [
                              DataColumn(label: Text('id', style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                              DataColumn(label: Text('Price', style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                              DataColumn(label: Text('Vol', style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                            ],
                            rows: buyOrders
                                .map((order) =>
                                DataRow(cells: [
                                  DataCell(Text(order['id'].toString(),
                                      style: TextStyle(color: Colors.white))),
                                  DataCell(Text(order['price'].toString(),
                                      style: TextStyle(color: Colors.white))),
                                  DataCell(Text(order['volume'].toString(),
                                      style: TextStyle(color: Colors.white))),
                                ]))
                                .toList(),
                          ),

                        ],
                      ),
                    ),
                  ),

                  const VerticalDivider(width: 2.5, color: Colors.grey),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'Sell Orders',
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFB1E457)),
                          ),
                          const SizedBox(height: 10),
                          DataTable(
                            columns: const [
                              DataColumn(label: Text('id', style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                              DataColumn(label: Text('Price', style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                              DataColumn(label: Text('Vol', style: TextStyle(
                                  fontSize: 16, color: Colors.white))),
                            ],
                            rows: buyOrders
                                .map((order) =>
                                DataRow(cells: [
                                  DataCell(Text(order['id'].toString(),
                                      style: TextStyle(color: Colors.white))),
                                  DataCell(Text(order['price'].toString(),
                                      style: TextStyle(color: Colors.white))),
                                  DataCell(Text(order['volume'].toString(),
                                      style: TextStyle(color: Colors.white))),
                                ]))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () =>
                            {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: const Color(0xFF212936),
                              builder: (BuildContext context) {
                                int selectedCurrencyId = 1; // Default to currency ID 1 (BTC)

                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      // Title label
                                      const Text(
                                        "Create New Order",
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFFB1E457)),
                                      ),
                                      const SizedBox(height: 20),

                                      // Dropdown to choose Buy or Sell
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Order Type", style: TextStyle(color: Colors.white)),
                                          DropdownButton<String>(
                                            value: "Buy", // Default value
                                            dropdownColor: const Color(0xFF212936), // Dark background for dropdown
                                            items: const [
                                              DropdownMenuItem(value: "Buy", child: Text("Buy", style: TextStyle(color: Colors.white))),
                                              DropdownMenuItem(value: "Sell", child: Text("Sell", style: TextStyle(color: Colors.white))),
                                            ],
                                            onChanged: (String? newValue) {
                                            // Handle selection of Buy/Sell
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),

                                      // Currency Dropdown with dark background
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Currency", style: TextStyle(color: Colors.white)),
                                          DropdownButton<int>(
                                            value: selectedCurrencyId,
                                            dropdownColor: Color(0xFF212936), // Dark background for the dropdown items
                                            items: currencyMap.keys.map((int id) {
                                              return DropdownMenuItem<int>(
                                                value: id,
                                                child: Container(
                                                   // Dark background for each item
                                                  child: Row(
                                                    children: [
                                                      Icon(currencyIcons[id], color: Colors.white), // Icon for the currency
                                                      const SizedBox(width: 10),
                                                      Text(currencyMap[id] ?? '', style: TextStyle(color: Colors.white)), // Currency acronym
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (int? newCurrencyId) {
                                            // Handle currency selection
                                            selectedCurrencyId = newCurrencyId!;
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),

                                      // Price input
                                      TextField(
                                        decoration: const InputDecoration(
                                          labelText: "Price",
                                          labelStyle: TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                        // Handle price input
                                        },
                                      ),
                                      const SizedBox(height: 10),

                                      // Volume input
                                      TextField(
                                        decoration: const InputDecoration(
                                          labelText: "Volume",
                                          labelStyle: TextStyle(color: Colors.grey),
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                        // Handle volume input
                                        },
                                      ),
                                      const SizedBox(height: 20),

                                      // Submit button for the order
                                      ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text("Hello World!"),
                                          )
                                        );
                                      },
                                      child: const Text("Submit Order", style: TextStyle(fontSize: 16, color: Colors.black)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFFB1E457),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(22),
                                        )
                                      ),
                                    ),
                                    ],
                                  ),
                                );
                              },
                            )

                        },
                            child: Text("New Buy Order", style: TextStyle(fontSize: 15, color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB1E457),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              )
                            )
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () => {},
                            child: Text("New Sell Order", style: TextStyle(fontSize: 15, color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB1E457),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                          )
                        )
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
