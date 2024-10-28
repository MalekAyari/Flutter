import 'package:flutter/material.dart';
import 'package:flutter_app/Entities/wallet.dart';
import 'package:flutter_app/Pages/CurrencyMarket.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_app/Pages/Orderbook.dart';

class MyWalletPage extends StatefulWidget {
  @override
  _MyWalletPageState createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  // Constants
  final String userId = '671e91ef7b7e347c73472bef'; // Replace with dynamic userId if needed

  // Wallet data variables
  String owner = 'Awaiting Data';
  double balance = 0.0;
  String currency = 'N/A';

  // Flag to check if data is loading
  bool isLoading = true;
  bool isFound = false;

  @override
  void initState() {
    super.initState();
    fetchWalletData();
  }

  void fetchUserData() async{
    final String url = 'http://10.0.2.2:3000/api/wallet/$userId';
  }

  // Fetch wallet data
  void fetchWalletData() async {
    final String url = 'http://10.0.2.2:3000/api/wallet/$userId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Convert balance to double safely

        setState(() {
          owner = data['userId'].substring(0, 10);
          balance = (data['balance'] as num).toDouble();
          currency = data['currency'];
          isFound = true;
          isLoading = false; // Update isLoading here
        });
      } else {
        print("Failed to load wallet data. Status code: ${response.statusCode}");
        if (response.statusCode == 404){
          owner = "Not Found";
          isLoading = false; // Update isLoading here
        }
        setState(() {
          isLoading = false; // Update isLoading here even if the request fails
        });
      }
    } catch (e) {
      print("Error fetching wallet data: $e");
      setState(() {
        isLoading = false; // Update isLoading here in case of an error
      });
    }
  }
  void createWallet() async {
    final String url = 'http://10.0.2.2:3000/api/wallet/create';

    // Example data for creating a new wallet
    final Map<String, dynamic> walletData = {
      'userId': userId,
      'balance': 0.0,
      'currency': 'USD', // Replace with the desired default currency
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(walletData),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        setState(() {
          owner = data['userId'].substring(0, 10);
          balance = (data['balance'] as num).toDouble();
          currency = data['currency'];
          isFound = true;
          isLoading = false;
        });
        print("Wallet created successfully.");
      } else {
        print("Failed to create wallet. Status code: ${response.statusCode}");
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error creating wallet: $e");
      setState(() {
        isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212936),
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : isFound ?
            Padding(
            padding: const EdgeInsets.all(50),
            child: Center(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Owner:",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFB1E457),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 108),
                  Text(
                    owner,
                    style: const TextStyle(
                        fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Balance:",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFB1E457),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 115),
                  Text(
                    "$balance $currency",
                    style: const TextStyle(
                        fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Currency:",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFB1E457),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 170),
                  Text(
                    currency,
                    style: const TextStyle(
                        fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the OrderBook page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CurrencyMarket()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB1E457),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: const Text('See Currency Market', style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the OrderBook page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderBook()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB1E457),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: const Text('See Order Book', style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ) :
            Padding(
              padding: const EdgeInsets.all(50),
              child: Center(
                child: Column(
                  children: [
                    Text("User: $userId" , textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.white)),
                    SizedBox(height: 20),
                    Text("No wallet found for this user, would you like to create one?", style: TextStyle(fontSize: 18, color: Colors.white),  textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the OrderBook page
                        createWallet();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB1E457),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: const Text('New Wallet...', style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),

                  ],
                ),
              ),
            )
    );
  }
}
