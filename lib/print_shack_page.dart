import 'package:flutter/material.dart';

class PrintShackPage extends StatefulWidget {
  const PrintShackPage({super.key});

  @override
  _PrintShackPageState createState() => _PrintShackPageState();
}

class _PrintShackPageState extends State<PrintShackPage> {
  String _productType = 'Hoodie';
  String _color = 'Black';
  String _text = '';
  double _price = 25.00;

  void _updatePrice() {
    setState(() {
      if (_productType == 'Hoodie') {
        _price = 25.00;
      } else {
        _price = 15.00;
      }
      if (_text.isNotEmpty) {
        _price += 5.00;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Print Shack'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personalise your product',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _productType,
              items: const ['Hoodie', 'T-Shirt'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _productType = newValue!;
                  _updatePrice();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Product Type',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _color,
              items: const ['Black', 'White', 'Grey'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _color = newValue!;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Color',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _text = value;
                  _updatePrice();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Text to print',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Price: £${_price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
