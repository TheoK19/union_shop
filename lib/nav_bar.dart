import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/auth_service.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return LayoutBuilder(
      builder: (context, constraints) {
        return StreamBuilder<User?>(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            final user = snapshot.data;

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
                    _navBarButton(context, 'FAQ', '/faq'),
                  ],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.grey),
                    onPressed: () {},
                  ),
                  if (user == null)
                    IconButton(
                      icon: const Icon(Icons.person_outline, color: Colors.grey),
                      onPressed: () => Navigator.pushNamed(context, '/auth'),
                    )
                  else
                    TextButton(
                      onPressed: () async {
                        await authService.signOut();
                      },
                      child: const Text('LOGOUT', style: TextStyle(color: Colors.black)),
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
                  if (user == null)
                    IconButton(
                      icon: const Icon(Icons.person_outline, color: Colors.grey),
                      onPressed: () => Navigator.pushNamed(context, '/auth'),
                    )
                  else
                    IconButton(
                      icon: const Icon(Icons.logout, color: Colors.grey),
                      onPressed: () async {
                        await authService.signOut();
                      },
                    ),
                  IconButton(
                    icon: const Icon(Icons.shopping_bag_outlined, color: Colors.grey),
                    onPressed: () {},
                  ),
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ),
                ],
              );
            }
          },
        );
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
