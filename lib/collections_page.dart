import 'package:flutter/material.dart';
import 'package:union_shop/collection_detail_page.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> collections = [
      {
        'title': 'Autumn Favourites',
        'image':
            'https://images.pexels.com/photos/1485781/pexels-photo-1485781.jpeg',
      },
      {
        'title': 'Sale Items',
        'image':
            'https://images.pexels.com/photos/325876/pexels-photo-325876.jpeg',
      },
      {
        'title': 'Freshers 2024',
        'image':
            'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg',
      },
      {
        'title': 'Graduation',
        'image':
            'https://images.pexels.com/photos/267885/pexels-photo-267885.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collections'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final collection = collections[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CollectionDetailPage(
                    collectionName: collection['title']!,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      collection['image']!,
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
                      collection['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
