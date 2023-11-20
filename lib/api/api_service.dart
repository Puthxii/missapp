import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:missapp/models/product_model.dart';

class ApiService {
  static String get baseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'https://localhost:5001/api';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      print(jsonResponse); // Print the response data
      List<Product> products =
          jsonResponse.map((data) => Product.fromJson(data)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
  // Other API functions for different endpoints, methods, etc.
}
