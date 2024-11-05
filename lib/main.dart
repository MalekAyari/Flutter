import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Orderbook.dart';
import 'package:flutter_app/Pages/wallet.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blockera',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: MyWalletPage(),
      ),
    );
  }
}
