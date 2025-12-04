import 'package:union_shop/models/collection.dart';

class CollectionsService {
  // Fetches all collections
  Future<List<Collection>> getCollections() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Return a list of hardcoded collections
    return [
      Collection(
        name: 'Essential Range',
        description: 'High-quality essentials for everyday wear.',
        imageUrl:
            'https://images.pexels.com/photos/6958620/pexels-photo-6958620.jpeg',
      ),
      Collection(
        name: 'Signature Range',
        description: 'Our premium collection, designed for a modern look.',
        imageUrl:
            'https://images.pexels.com/photos/4909505/pexels-photo-4909505.jpeg',
      ),
      Collection(
        name: 'Portsmouth City Collection',
        description: 'Show your city pride with our exclusive collection.',
        imageUrl:
            'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
      ),
      Collection(
        name: 'Graduation',
        description: 'Celebrate your achievement with our graduation collection.',
        imageUrl:
            'https://images.pexels.com/photos/4145153/pexels-photo-4145153.jpeg',
      ),
      Collection(
        name: 'Autumn',
        description: 'Stay warm and stylish with our autumn collection.',
        imageUrl:
            'https://images.pexels.com/photos/5710185/pexels-photo-5710185.jpeg',
      ),
    ];
  }
}
