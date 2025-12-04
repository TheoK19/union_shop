import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: const Color(0xFF4d2963),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About the Union Shop',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Image.network(
                'https://images.pexels.com/photos/1202849/pexels-photo-1202849.jpeg',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    height: 200,
                    child: const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                'A little bit about us...',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'The Union Shop is your one-stop-shop for all your student needs. We are part of the University of Portsmouth Students\' Union, a registered charity dedicated to improving the lives of students at the University of Portsmouth.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),
              const Text(
                'All profits from the Union Shop are reinvested back into the Students\' Union to support the services we offer to students. This includes our free, independent advice service, our wide range of sports clubs and societies, and our work to represent students to the University.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 24),
              Text(
                'Our Products',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const Text(
                'We stock a wide range of products, from University of Portsmouth branded clothing and gifts to stationery, snacks, and drinks. We also have a print shack where you can get your documents printed, bound, and laminated.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
