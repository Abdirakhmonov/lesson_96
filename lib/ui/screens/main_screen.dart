import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson_96/config/app_router.dart';
import 'package:lesson_96/ui/widgets/category_widget.dart';
import 'package:lesson_96/ui/widgets/custom_drawer.dart';
import 'package:lesson_96/ui/widgets/custom_textfield.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> categories = [
    "All categories",
    'Gadgets',
    'Clothes',
    'Accessories'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/brand.png",
          height: 40,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AppRouter.detailScreen);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(AppRouter.cartScreen);
            },
            icon: const Icon(Icons.person_outline),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverToBoxAdapter(
              child: CustomTextfield(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(text: categories[index]);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/banner.png"),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle(title: 'Deals and offers'),
                  ProductList(products: [
                    ProductModel(
                        name: 'Smart Jacket',
                        price: '\$79.99',
                        image:
                            'https://marketplace.canva.com/print-mockup/bundle/E9Me4jcyzMX/fit%3Afemale%2Cpages%3Adouble-sided%2Csurface%3Amarketplace/product%3A171618%2Csurface%3Amarketplace/EAFhG-QWahU/2/0/933w/canva-black-and-white-minimalist-typography-t-shirt-AO-OS34nryc.png?sig=b6208d2bd46d9d59b6b072bcfcd19c49&width=800',
                        discount: '25% off'),
                    ProductModel(
                        name: 'Smart Headset',
                        price: '\$49.99',
                        image:
                            'https://chriscross.in/cdn/shop/files/95_1000x.jpg?v=1695712761',
                        discount: '10% off'),
                    ProductModel(
                        name: 'Smart Watch',
                        price: '\$199.99',
                        image:
                            'https://prd.cc.duluthtrading.com/dw/image/v2/BBNM_PRD/on/demandware.static/-/Sites-dtc-master-catalog/default/dw13c50eee/images/large/76020_EBR.jpg?sw=980',
                        discount: '30% off'),
                  ]),
                  const SectionTitle(title: 'Home and outdoor'),
                  ProductList(products: [
                    ProductModel(
                        name: 'Smart Table',
                        price: '\$129.99',
                        image:
                            'https://www.cnet.com/a/img/resize/690ad0a97cf8fc98f3cf851e7b149d2ffc5b171e/hub/2023/05/04/31dfdcf2-1ac3-4320-b40c-4c356300f06e/google-pixel-7a-phone-14.jpg?auto=webp&height=500'),
                    ProductModel(
                        name: 'Smart WebCam',
                        price: '\$89.99',
                        image:
                            'https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402431-smartphones-apple-iphone-12-10016496.png'),
                  ]),
                  const SectionTitle(title: 'Consumer electronics'),
                  ProductList(products: [
                    ProductModel(
                        name: 'Smart Phone',
                        price: '\$599.99',
                        image:
                            'https://www.cnet.com/a/img/resize/690ad0a97cf8fc98f3cf851e7b149d2ffc5b171e/hub/2023/05/04/31dfdcf2-1ac3-4320-b40c-4c356300f06e/google-pixel-7a-phone-14.jpg?auto=webp&height=500'),
                    ProductModel(
                        name: 'Smart Tablet',
                        price: '\$499.99',
                        image:
                            'https://crdms.images.consumerreports.org/f_auto,w_600/prod/products/cr/models/402431-smartphones-apple-iphone-12-10016496.png'),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<ProductModel> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            height: 70,
            fit: BoxFit.cover,
          ),
          Text(
            product.name,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            product.price,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          if (product.discount != null)
            Text(
              product.discount!,
              style: const TextStyle(fontSize: 10, color: Colors.red),
            ),
        ],
      ),
    );
  }
}

class ProductModel {
  final String name;
  final String price;
  final String image;
  final String? discount;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    this.discount,
  });
}
