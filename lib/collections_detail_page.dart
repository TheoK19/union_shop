// lib/collection_detail_page.dart
import 'package:flutter/material.dart';

class CollectionDetailPage extends StatelessWidget {
  final String collectionName;

  const CollectionDetailPage({
    super.key,
    required this.collectionName,
  });

  // In a “real” app these would come from a model/repository.
  // For basic marks, hardcoded dummy products are fine.
  List<Map<String, String>> getProductsForCollection() {
    // You can customise these per collectionName if you want,
    // but it’s not required for the basic tier.
    return [
      {
        'title': '$collectionName Item 1',
        'price': '£12.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
      {
        'title': '$collectionName Item 2',
        'price': '£15.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
      {
        'title': '$collectionName Item 3',
        'price': '£18.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
      {
        'title': '$collectionName Item 4',
        'price': '£20.00',
        'image':
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final products = getProductsForCollection();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 600 ? 2 : 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Simple “filters” row – for basic level these don’t have to do anything
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'Default',
                    items: const [
                      DropdownMenuItem(
                        value: 'Default',
                        child: Text('Sort: Default'),
                      ),
                      DropdownMenuItem(
                        value: 'PriceLowHigh',
                        child: Text('Sort: Price (Low → High)'),
                      ),
                      DropdownMenuItem(
                        value: 'PriceHighLow',
                        child: Text('Sort: Price (High → Low)'),
                      ),
                    ],
                    onChanged: (value) {
                      // For basic tier, no actual sorting logic required.
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: 'All',
                    items: const [
                      DropdownMenuItem(
                        value: 'All',
                        child: Text('Filter: All'),
                      ),
                      DropdownMenuItem(
                        value: 'InStock',
                        child: Text('Filter: In stock'),
                      ),
                      DropdownMenuItem(
                        value: 'OnSale',
                        child: Text('Filter: On sale'),
                      ),
                    ],
                    onChanged: (value) {
                      // Again, widgets don’t need to function for basic marks.
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
                children: products.map((product) {
                  return _CollectionProductCard(
                    title: product['title']!,
                    price: product['price']!,
                    imageUrl: product['image']!,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CollectionProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const _CollectionProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // For basic level this doesn’t need to navigate anywhere.
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tapped on "$title" (dummy product).'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
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
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            price,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
