import 'package:flutter/material.dart';
import 'product_details.dart'; // Ensure this file is correctly named and placed in the 'lib' folder

void main() {
  runApp(ProductNavigationApp());
}

class ProductNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Pixel 1',
      'description': 'Pixel is the most fearful phone ever.',
      'price': 800,
    },
    {
      'name': 'Laptop',
      'description': 'Laptop is the most productive development tool.',
      'price': 2000,
    },
    {
      'name': 'Tablet',
      'description': 'Tablet is the most useful device ever for meeting.',
      'price': 1500,
    },
    {
      'name': 'Pen Drive',
      'description': 'Pen Drive is a stylish phone ever.',
      'price': 100,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  products[index]['name'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '\$${products[index]['price']}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailsScreen(product: products[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
