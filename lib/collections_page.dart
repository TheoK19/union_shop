// lib/collections_page.dart
import 'package:flutter/material.dart';
import 'package:union_shop/collection_detail_page.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  // Hardcoded dummy collections – this is allowed for the basic tier
  List<Map<String, String>> get _collections => const [
        {
          'name': 'Hoodies & Jumpers',
          'description': 'Cosy university-branded hoodies and jumpers.',
          'image':
              'https://images.pexels.com/photos/6311587/pexels-photo-6311587.jpeg',
        },
        {
          'name': 'Mugs & Drinkware',
          'description': 'Keep your drinks warm in style.',
          'image':
              'https://images.pexels.com/photos/1410226/pexels-photo-1410226.jpeg',
        },
        {
          'name': 'Stationery',
          'description': 'Notebooks, pens, and study essentials.',
          'image':
              'https://images.pexels.com/photos/951240/pexels-photo-951240.jpeg',
        },
        {
          'name': 'Accessories',
          'description': 'Keyrings, lanyards, and small gifts.',
          'image':
              'https://images.pexels.com/photos/325876/pexels-photo-325876.jpeg',
        },
      ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 600 ? 2 : 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shop by collection',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Browse different Union Shop collections. All data here is dummy and hardcoded for coursework purposes.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 2,
                children: _collections.map((collection) {
                  return _CollectionCard(
                    name: collection['name']!,
                    description: collection['description']!,
                    imageUrl: collection['image']!,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CollectionDetailPage(
                            collectionName: collection['name']!,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  CollectionDetailPage({required String collectionName}) {}
}

class _CollectionCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final VoidCallback onTap;

  const _CollectionCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // for basic level this *can* be non-functional, but it’s nice that it works
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
