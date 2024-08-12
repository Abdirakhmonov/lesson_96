import 'package:flutter/material.dart';
import 'package:lesson_96/ui/widgets/category_widget.dart';
import 'package:lesson_96/ui/widgets/custom_textfield.dart';

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile accessory'),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomTextfield(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                'Tablets',
                'Phones',
                'Ipads',
                'Ipod',
                'Ja',
              ]
                  .map(
                    (text) => CategoryWidget(text: text),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: 'Newest',
                  items: [
                    'Newest',
                    'Oldest',
                    'Price: High to Low',
                    'Price: Low to High'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                const Row(
                  children: [
                    Text('Filter (3)'),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.grid_view),
                    Icon(Icons.list),
                  ],
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 8,
            children: [
              Chip(label: const Text('Huawei'), onDeleted: () {}),
              Chip(label: const Text('Apple'), onDeleted: () {}),
              Chip(label: const Text('64GB'), onDeleted: () {}),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network('https://via.placeholder.com/50'),
                  title: const Text('Regular Fit Resort Shirt'),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\$57.70'),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text('7.5 • 154 orders'),
                        ],
                      ),
                      Text('Free Shipping',
                          style: TextStyle(color: Colors.green)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Text('You may also like'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(3, (index) {
                return Container(
                  width: 150,
                  margin: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Image.network('https://via.placeholder.com/100'),
                      const Text('\$10.30'),
                      const Text('Product description'),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
