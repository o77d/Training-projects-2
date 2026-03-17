import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/pages/product_details.dart';
import 'package:flutter_application_2/widgets/category_fliter.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:flutter_application_2/widgets/product_item.dart';
import 'package:gap/gap.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = [
      ProductModel(
        name: 'Gray coat and white T-sh..',
        price: '150',
        image:
            'assets/images/models/469a39f070681c66ef7b0b841fe69af84f0424ba.png',
      ),
      ProductModel(
        name: "Lightweight Men's Puffer Jacket",
        price: '180',
        image: 'assets/images/models/image 4.png',
      ),
      ProductModel(
        name: 'Gray coat and white T-sh..',
        price: '120',
        image: 'assets/images/models/image44.png',
      ),
      ProductModel(
        name: "Classic Tailored Fit Men's Dress Shirt",
        price: '130',
        image: 'assets/images/models/image 1.png',
      ),
      ProductModel(
        name: 'Deep gray essential regul..',
        price: '130',
        image: 'assets/images/models/image 2.png',
      ),
      ProductModel(
        name: 'Top man black with Trous..',
        price: '130',
        image: 'assets/images/models/image 3.png',
      ),
    ];

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Men',
        prefixIcon: 'assets/svgs/arrow-left.svg',
        suffixIcon: 'assets/svgs/Vector.svg',
      ),
      body: Column(
        children: [
          // first section
          CategoryFilter(),
          Gap(13),

          // products
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1 / 1.9,
                ),

                itemBuilder: (context, index) {
                  final item = products[index];
                  return ProductItem(
                    name: item.name,
                    price: item.price,
                    image: item.image,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => ProductDetails(
                            name: item.name,
                            price: item.price,
                            image: item.image,
                      )),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
