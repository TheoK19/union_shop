import 'package:flutter/material.dart';

class PrintShackAboutPage extends StatefulWidget {
  const PrintShackAboutPage({super.key});

  @override
  _PrintShackAboutPageState createState() => _PrintShackAboutPageState();
}

class _PrintShackAboutPageState extends State<PrintShackAboutPage> {
  String? _selectedService = 'Document Printing';
  final _formKey = GlobalKey<FormState>();

  // Form field controllers
  String? _paperSize;
  String? _paperType;
  String? _printColor;
  String? _apparelType;
  String? _apparelSize;
  String? _apparelColor;
  String? _posterSize;
  String? _posterFinish;
  final _quantityController = TextEditingController(text: '1');

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About the Print Shack'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
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
                DropdownButtonFormField<String>(
                  value: _selectedService,
                  decoration: const InputDecoration(
                    labelText: 'Select a Service',
                    border: OutlineInputBorder(),
                  ),
                  items: <String>[
                    'Document Printing',
                    'Custom Apparel',
                    'Poster Printing'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedService = newValue;
                      // Reset form fields when service changes
                      _paperSize = null;
                      _paperType = null;
                      _printColor = null;
                      _apparelType = null;
                      _apparelSize = null;
                      _apparelColor = null;
                      _posterSize = null;
                      _posterFinish = null;
                      _quantityController.text = '1';
                    });
                  },
                ),
                const SizedBox(height: 24),
                if (_selectedService != null) ...[
                  Text(
                    '$_selectedService Details',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDynamicForm(),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Process data
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('SUBMIT'),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDynamicForm() {
    switch (_selectedService) {
      case 'Document Printing':
        return _buildDocumentPrintingForm();
      case 'Custom Apparel':
        return _buildCustomApparelForm();
      case 'Poster Printing':
        return _buildPosterPrintingForm();
      default:
        return Container();
    }
  }

  Widget _buildDocumentPrintingForm() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: _paperSize,
          decoration: const InputDecoration(labelText: 'Paper Size'),
          items: ['A4', 'A3', 'Letter', 'Legal']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _paperSize = value),
          validator: (value) => value == null ? 'Please select a paper size' : null,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _paperType,
          decoration: const InputDecoration(labelText: 'Paper Type'),
          items: ['Standard', 'Glossy', 'Cardstock']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _paperType = value),
           validator: (value) => value == null ? 'Please select a paper type' : null,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _printColor,
          decoration: const InputDecoration(labelText: 'Color'),
          items: ['Black & White', 'Full Color']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _printColor = value),
           validator: (value) => value == null ? 'Please select a color option' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _quantityController,
          decoration: const InputDecoration(labelText: 'Quantity'),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a quantity';
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return 'Please enter a valid quantity';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildCustomApparelForm() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: _apparelType,
          decoration: const InputDecoration(labelText: 'Apparel Type'),
          items: ['T-Shirt', 'Hoodie', 'Sweatshirt']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _apparelType = value),
          validator: (value) => value == null ? 'Please select an apparel type' : null,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _apparelSize,
          decoration: const InputDecoration(labelText: 'Size'),
          items: ['S', 'M', 'L', 'XL', 'XXL']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _apparelSize = value),
          validator: (value) => value == null ? 'Please select a size' : null,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _apparelColor,
          decoration: const InputDecoration(labelText: 'Color'),
          items: ['White', 'Black', 'Grey', 'Navy']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _apparelColor = value),
           validator: (value) => value == null ? 'Please select a color' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _quantityController,
          decoration: const InputDecoration(labelText: 'Quantity'),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a quantity';
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return 'Please enter a valid quantity';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPosterPrintingForm() {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: _posterSize,
          decoration: const InputDecoration(labelText: 'Poster Size'),
          items: ['18x24', '24x36', '27x40']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _posterSize = value),
          validator: (value) => value == null ? 'Please select a poster size' : null,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _posterFinish,
          decoration: const InputDecoration(labelText: 'Finish'),
          items: ['Matte', 'Glossy', 'Satin']
              .map((label) => DropdownMenuItem(child: Text(label), value: label))
              .toList(),
          onChanged: (value) => setState(() => _posterFinish = value),
          validator: (value) => value == null ? 'Please select a finish' : null,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _quantityController,
          decoration: const InputDecoration(labelText: 'Quantity'),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a quantity';
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return 'Please enter a valid quantity';
            }
            return null;
          },
        ),
      ],
    );
  }
}
