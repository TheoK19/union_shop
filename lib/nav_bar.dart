import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // Desktop view
          return AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 1,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false),
                  child: Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    height: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 48),
                _navBarButton(context, 'ABOUT US', '/about-us'),
                _navBarButton(context, 'SALE', '/sale'),
                _navBarButton(context, 'COLLECTIONS', '/collections'),
                _navBarButton(context, 'PRINT SHACK', '/print-shack'),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.grey),
                onPressed: () => Navigator.pushNamed(context, '/auth'),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
                onPressed: () {},
              ),
              const SizedBox(width: 20),
            ],
          );
        } else {
          // Mobile view
          return AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            leading: GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/', (route) => false),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.network(
                  'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            leadingWidth: 120,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.grey),
                onPressed: () => Navigator.pushNamed(context, '/auth'),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  // Dummy function, does nothing
                },
              ),
            ],
          );
        }
      },
    );
  }

  Widget _navBarButton(BuildContext context, String text, String routeName) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
