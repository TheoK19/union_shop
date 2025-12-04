import 'package:flutter/material.dart';

class CollectionDetailPage extends StatelessWidget {
  final String collectionName;

  const CollectionDetailPage({super.key, required this.collectionName});

  @override
  Widget build(BuildContext context) {
    // Dummy data for products in the collection
    final List<Map<String, String>> products = [
      {
        'title': 'Signature Hoodie',
        'price': '£35.00',
        'imageUrl':
            'https://images.pexels.com/photos/4909505/pexels-photo-4909505.jpeg',
      },
      {
        'title': 'Signature T-Shirt',
        'price': '£15.00',
        'imageUrl':
            'https://images.pexels.com/photos/2112648/pexels-photo-2112648.jpeg',
      },
      {
        'title': 'Essential Hoodie',
        'price': '£25.00',
        'imageUrl':
            'https://images.pexels.com/photos/6958620/pexels-photo-6958620.jpeg',
      },
      {
        'title': 'Essential T-Shirt',
        'price': '£12.00',
        'imageUrl':
            'https://images.pexels.com/photos/9558567/pexels-photo-9558567.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
      ),
      body: Column(
        children: [
          // Filter and Sort Dropdowns
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: 'Sort By',
                  items: <String>['Sort By', 'Price: Low to High', 'Price: High to Low']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Dummy function, does nothing
                  },
                ),
                DropdownButton<String>(
                  value: 'Filter By',
                  items: <String>['Filter By', 'Size', 'Color']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Dummy function, does nothing
                  },
                ),
              ],
            ),
          ),
          // Product Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          product['imageUrl']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.image_not_supported, color: Colors.grey),
                          ),
                        );
                      },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product['price']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
