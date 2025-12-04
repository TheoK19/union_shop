import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/services/collections_service.dart';

void main() {
  group('CollectionsService', () {
    test('getCollections returns a list of collections', () async {
      // Arrange
      final collectionsService = CollectionsService();

      // Act
      final collections = await collectionsService.getCollections();

      // Assert
      expect(collections, isA<List<Collection>>());
      expect(collections.isNotEmpty, isTrue);
    });
  });
}
