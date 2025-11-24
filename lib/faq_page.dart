import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
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
                'Frequently Asked Questions',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 24),
              const FaqItem(
                question: 'What are your opening hours?',
                answer:
                    'Our opening hours are Monday to Friday, 9am to 5pm. We are closed on weekends and bank holidays.',
              ),
              const SizedBox(height: 16),
              const FaqItem(
                question: 'Do you offer a student discount?',
                answer:
                    'Yes, we offer a 10% student discount on all our products. Please show your student ID at the checkout to redeem your discount.',
              ),
              const SizedBox(height: 16),
              const FaqItem(
                question: 'Can I return an item?',
                answer:
                    'Yes, you can return an item within 28 days of purchase. Please see our Shipping & Returns page for more information.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }
}
