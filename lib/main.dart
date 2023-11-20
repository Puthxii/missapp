import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:missapp/screens/product_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); // Load the environment variables
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductScreen(), // Set the ProductScreen as the home screen
    );
  }
}
