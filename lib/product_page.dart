import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded product data
    const String productName = 'Signature Hoodie';
    const String productPrice = '£35.00';
    const String imageUrl =
        'https://images.pexels.com/photos/4909505/pexels-photo-4909505.jpeg';
    const String productDescription =
        'A comfortable and stylish hoodie, perfect for any occasion. Made from 100% premium cotton, this hoodie features a soft fleece interior and a durable exterior. It includes a spacious front pocket, an adjustable drawstring hood, and ribbed cuffs and hem for a snug fit. Available in various sizes and colors.';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 300,
                  width: 300,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      height: 300,
                      width: 300,
                      child: const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Product Title
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Product Price
              Text(
                productPrice,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 24),

              // Dropdowns for Size and Quantity
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: 'M',
                      decoration: const InputDecoration(
                        labelText: 'Size',
                        border: OutlineInputBorder(),
                      ),
                      items: <String>['S', 'M', 'L', 'XL']
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
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      value: 1,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(),
                      ),
                      items: <int>[1, 2, 3, 4, 5]
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (int? newValue) {
                        // Dummy function, does nothing
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Add to Cart Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Dummy function, does nothing
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('This button is not functional yet.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF4d2963),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'ADD TO CART',
                    style: TextStyle(fontSize: 16, letterSpacing: 1),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Product Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                productDescription,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
