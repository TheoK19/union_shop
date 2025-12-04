import 'package:flutter/material.dart';

class CollectionDetailPage extends StatelessWidget {
  final String collectionName;

  const CollectionDetailPage({super.key, required this.collectionName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
      ),
      body: Center(
        child: Text('Products in the $collectionName collection'),
      ),
    );
  }
}
