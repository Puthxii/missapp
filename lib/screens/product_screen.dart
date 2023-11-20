import 'package:flutter/material.dart';
import 'package:missapp/api/api_service.dart';
import 'package:missapp/models/product_model.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = ApiService
        .fetchProducts(); // Assuming fetchProducts returns a List<Product>
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name ?? 'No Name'),
                  // Customize ListTile with your product data
                );
              },
            );
          }
        },
      ),
    );
  }
}
