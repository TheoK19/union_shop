import 'package:flutter/material.dart';

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Print Shack'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Our Services',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _buildServiceItem(
                context,
                'Document Printing',
                'High-quality printing for all your academic and personal needs. We offer a variety of paper sizes and finishes.',
              ),
              _buildServiceItem(
                context,
                'Custom Apparel',
                'Personalize your clothing with our custom printing services. We can print on t-shirts, hoodies, and more.',
              ),
              _buildServiceItem(
                context,
                'Poster Printing',
                'Make a statement with our large-format poster printing. Perfect for presentations, events, and room decor.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(
      BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
