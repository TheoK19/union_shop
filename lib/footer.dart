import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      color: const Color(0xFF4d2963),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: isDesktop ? _buildDesktopFooter(context) : _buildMobileFooter(context),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFooterColumn(
          context,
          'SHOP',
          ['Essential Range', 'Signature Range', 'Freshers'],
        ),
        _buildFooterColumn(
          context,
          'ABOUT US',
          ['About Us', 'Contact', 'Store Location', 'Careers'],
        ),
        _buildFooterColumn(
          context,
          'HELP & INFORMATION',
          ['Track My Order', 'Delivery & Returns', 'Student Discount', 'FAQ'],
        ),
        _buildNewsletterColumn(context),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      children: [
        _buildExpansionTile(context, 'SHOP', ['Essential Range', 'Signature Range', 'Freshers']),
        _buildExpansionTile(context, 'ABOUT US', ['About Us', 'Contact', 'Store Location', 'Careers']),
        _buildExpansionTile(context, 'HELP & INFORMATION', ['Track My Order', 'Delivery & Returns', 'Student Discount', 'FAQ']),
        const SizedBox(height: 24),
        _buildNewsletterColumn(context),
      ],
    );
  }

  Widget _buildFooterColumn(BuildContext context, String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                link,
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpansionTile(BuildContext context, String title, List<String> links) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        children: links.map((link) => ListTile(
          title: Text(link, style: TextStyle(color: Colors.grey[400], fontSize: 14)),
          onTap: () {},
        )).toList(),
      ),
    );
  }

  Widget _buildNewsletterColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'JOIN OUR NEWSLETTER',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Get the latest offers, discounts, and news from the Union Shop straight to your inbox.',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              color: const Color(0xFFf07b07),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            IconButton(icon: const Icon(Icons.facebook, color: Colors.white), onPressed: () {}),
            IconButton(icon: const Icon(Icons.snapchat, color: Colors.white), onPressed: () {}),
            IconButton(icon: const Icon(Icons.tiktok, color: Colors.white), onPressed: () {}),
          ],
        )
      ],
    );
  }
}
