import 'package:flutter/material.dart';
import 'package:union_shop/about_us_page.dart';
import 'package:union_shop/faq_page.dart';
import 'package:union_shop/footer.dart';
import 'package:union_shop/product_page.dart';
import 'package:union_shop/collections_page.dart';
import 'package:union_shop/collection_detail_page.dart';
import 'package:union_shop/sale_page.dart';
import 'package:union_shop/auth_page.dart';
import 'package:union_shop/nav_bar.dart';
import 'package:union_shop/print_shack_page.dart';
import 'package:union_shop/print_shack_about_page.dart';

class CartItem {
  final String title;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

// Global cart list (very simple approach)
final List<CartItem> cartItems = [];

void addToCart(String title, String priceText, String imageUrl) {
  // priceText looks like '£25.00' → we strip the £ and parse
  final price =
      double.tryParse(priceText.replaceAll('£', '').trim()) ?? 0.0;

  // If item already in cart, just increase quantity
  final existingIndex =
      cartItems.indexWhere((item) => item.title == title);
  if (existingIndex != -1) {
    cartItems[existingIndex].quantity++;
  } else {
    cartItems.add(
      CartItem(title: title, imageUrl: imageUrl, price: price),
    );
  }
}



void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Union Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
        ),
        home: const HomeScreen(),
        initialRoute: '/',
        routes: {
          '/product': (context) => const ProductPage(),
          '/about-us': (context) => const AboutUsPage(),
          '/faq': (context) => const FaqPage(),
          '/collections': (context) => const CollectionsPage(),
          '/sale': (context) => const SalePage(),
          '/auth': (context) => const AuthPage(),
          '/print-shack': (context) => const PrintShackPage(),
          '/print-shack-about': (context) => const PrintShackAboutPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/collection-detail') {
            final args = settings.arguments as Map<String, String>;
            final collectionName = args['collectionName']!;
            return MaterialPageRoute(
              builder: (context) {
                return CollectionDetailPage(collectionName: collectionName);
              },
            );
          }
          return null;
        });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            SizedBox(
              height: 360,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image (hoodies row)
                  Positioned.fill(
                    child: Image.network(
                      'https://images.pexels.com/photos/6311587/pexels-photo-6311587.jpeg',
                      fit: BoxFit.cover,
                      color: Colors.black.withOpacity(0.6), // dark overlay tint
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),

                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Essential Range -- 20% Off',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Over 20% off on our Essential Range , Come grab yours while stock still lasts!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/collections'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE COLLECTIONS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Products Section
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'ESSENTIAL RANGE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Essential Hoodie',
                          price: '£25.00',
                          imageUrl:
                              'https://images.pexels.com/photos/6958620/pexels-photo-6958620.jpeg',
                        ),
                        ProductCard(
                          title: 'Essential T-Shirt',
                          price: '£12.00',
                          imageUrl:
                              'https://images.pexels.com/photos/9558567/pexels-photo-9558567.jpeg',
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'SIGNATURE RANGE',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Signature Hoodie',
                          price: '£35.00',
                          imageUrl:
                              'https://images.pexels.com/photos/4909505/pexels-photo-4909505.jpeg',
                        ),
                        ProductCard(
                          title: 'Signature T-Shirt',
                          price: '£15.00',
                          imageUrl:
                              'https://images.pexels.com/photos/2112648/pexels-photo-2112648.jpeg',
                        ),
                      ],
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'PORTSMOUTH CITY COLLECTION',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Portsmouth City Magnet',
                          price: '£10.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Gift Item',
                          price: '£15.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Double Magnet ',
                          price: '£20.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Placeholder ',
                          price: '£25.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrl,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black),
                maxLines: 2,
              ),
              const SizedBox(height: 4),
              Text(
                price,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
