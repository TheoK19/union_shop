import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for sale products
    final List<Map<String, String>> saleProducts = [
      {
        'title': 'Signature Hoodie',
        'originalPrice': '£35.00',
        'salePrice': '£28.00',
        'imageUrl':
            'https://images.pexels.com/photos/4909505/pexels-photo-4909505.jpeg',
      },
      {
        'title': 'Essential T-Shirt',
        'originalPrice': '£12.00',
        'salePrice': '£9.60',
        'imageUrl':
            'https://images.pexels.com/photos/9558567/pexels-photo-9558567.jpeg',
      },
      {
        'title': 'Signature T-Shirt',
        'originalPrice': '£15.00',
        'salePrice': '£12.00',
        'imageUrl':
            'https://images.pexels.com/photos/2112648/pexels-photo-2112648.jpeg',
      },
      {
        'title': 'Essential Hoodie',
        'originalPrice': '£25.00',
        'salePrice': '£20.00',
        'imageUrl':
            'https://images.pexels.com/photos/6958620/pexels-photo-6958620.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Collection'),
      ),
      body: Column(
        children: [
          // Promotional Message
          Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color(0xFF4d2963),
            width: double.infinity,
            child: const Text(
              'HURRY! LIMITED TIME OFFER - 20% OFF ALL SALE ITEMS!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Sale Product Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: saleProducts.length,
              itemBuilder: (context, index) {
                final product = saleProducts[index];
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
                        child: Row(
                          children: [
                            Text(
                              product['originalPrice']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              product['salePrice']!,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
