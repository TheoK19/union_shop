import 'package:flutter/material.dart';

class PrintShackAboutPage extends StatefulWidget {
  const PrintShackAboutPage({super.key});

  @override
  _PrintShackAboutPageState createState() => _PrintShackAboutPageState();
}

class _PrintShackAboutPageState extends State<PrintShackAboutPage> {
  String _selectedProduct = 'T-Shirt';
  String _customText = 'Your Text Here';
  String _selectedFont = 'Roboto';
  Color _selectedColor = Colors.black;
  final _textController = TextEditingController(text: 'Your Text Here');
  final _quantityController = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _customText = _textController.text;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personalize Your Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Live Preview
            const Text(
              'Live Preview',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Center(
                child: Text(
                  _customText,
                  style: TextStyle(
                    fontFamily: _selectedFont,
                    fontSize: 24,
                    color: _selectedColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Personalization Form
            const Text(
              'Personalization Options',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedProduct,
              decoration: const InputDecoration(labelText: 'Product'),
              items: ['T-Shirt', 'Hoodie', 'Mug']
                  .map((label) => DropdownMenuItem(child: Text(label), value: label))
                  .toList(),
              onChanged: (value) => setState(() => _selectedProduct = value!),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Custom Text'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedFont,
              decoration: const InputDecoration(labelText: 'Font'),
              items: ['Roboto', 'Lobster', 'Pacifico', 'Source Code Pro']
                  .map((label) => DropdownMenuItem(child: Text(label), value: label))
                  .toList(),
              onChanged: (value) => setState(() => _selectedFont = value!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Color>(
              value: _selectedColor,
              decoration: const InputDecoration(labelText: 'Text Color'),
              items: [Colors.black, Colors.white, Colors.blue, Colors.red, Colors.green]
                  .map((color) => DropdownMenuItem(
                        child: Text(color.toString().split('.').last.replaceAll(')', '')),
                        value: color,
                      ))
                  .toList(),
              onChanged: (value) => setState(() => _selectedColor = value!),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Add to cart logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added to Cart!')),
                );
              },
              child: const Text('ADD TO CART'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
