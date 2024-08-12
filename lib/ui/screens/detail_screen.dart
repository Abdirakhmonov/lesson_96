import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.black),
                onPressed: () {},
              ),
            ],
            floating: true,
            backgroundColor: Colors.white,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Image.network(
                        'https://marketplace.canva.com/print-mockup/bundle/E9Me4jcyzMX/fit%3Afemale%2Cpages%3Adouble-sided%2Csurface%3Amarketplace/product%3A171618%2Csurface%3Amarketplace/EAFhG-QWahU/2/0/933w/canva-black-and-white-minimalist-typography-t-shirt-AO-OS34nryc.png?sig=b6208d2bd46d9d59b6b072bcfcd19c49&width=800',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.circle,
                                      size: 8, color: Colors.white),
                                  SizedBox(width: 4),
                                  Icon(Icons.circle,
                                      size: 8, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Icon(Icons.circle,
                                      size: 8, color: Colors.grey),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star, color: Colors.orange, size: 20),
                          Icon(Icons.star_half, color: Colors.orange, size: 20),
                          SizedBox(width: 8),
                          Text('32 reviews',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(width: 8),
                          Icon(Icons.shopping_basket_outlined,
                              color: Colors.grey, size: 16),
                          SizedBox(width: 4),
                          Text('154 sold',
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Product name goes here',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '\$129.95 (50-100 pcs)',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Send inquiry',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          minimumSize: const Size(50, 50),
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.favorite_border),
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow('Condition', 'Brand new'),
                      _buildInfoRow('Material', 'Plastic'),
                      _buildInfoRow('Category', 'Electronics, gadgets'),
                      _buildInfoRow('Item num', '23421'),
                      const SizedBox(height: 16),
                      Text(
                        'Info about edu item is an ideal companion for anyone engaged in learning. The drone provides precise and ...',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Read more',
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(height: 16),
                      _buildSupplierInfo(),
                      const SizedBox(height: 24),
                      const Text(
                        'Similar products',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return _buildSimilarProductCard();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
              child: Text(label, style: const TextStyle(color: Colors.grey))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildSupplierInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: const Text('R', style: TextStyle(color: Colors.blue)),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Supplier', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Guanjoi Trading LLC'),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildSimilarProductCard() {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://via.placeholder.com/150x150',
              fit: BoxFit.cover),
          const SizedBox(height: 8),
          const Text('\$10.30', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('T-shirts with multiple colors, for men',
              style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
