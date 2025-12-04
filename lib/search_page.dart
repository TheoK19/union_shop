import 'package:flutter/material.dart';

// Dummy Product Data
class Product {
  final String name;
  final String price;
  final String imageUrl;

  const Product({required this.name, required this.price, required this.imageUrl});
}

final List<Product> allProducts = [
  const Product(name: 'Essential Hoodie', price: '£25.00', imageUrl: 'https://images.pexels.com/photos/6958620/pexels-photo-6958620.jpeg'),
  const Product(name: 'Essential T-Shirt', price: '£12.00', imageUrl: 'https://images.pexels.com/photos/9558567/pexels-photo-9558567.jpeg'),
  const Product(name: 'Signature Hoodie', price: '£35.00', imageUrl: 'https://images.pexels.com/photos/4909505/pexels-photo-4909505.jpeg'),
  const Product(name: 'Signature T-Shirt', price: '£15.00', imageUrl: 'https://images.pexels.com/photos/2112648/pexels-photo-2112648.jpeg'),
  const Product(name: 'Portsmouth City Magnet', price: '£10.00', imageUrl: 'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282'),
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  List<Product> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchResults = allProducts;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _searchResults = allProducts.where((product) {
        return product.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                hintText: 'Search for products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final product = _searchResults[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Text(product.price),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
