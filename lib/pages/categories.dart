import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/pages/product_details.dart';
import 'package:flutter_application_2/widgets/category_fliter.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:flutter_svg/svg.dart';
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
        name: 'Gray coat and white T-sh..',
        price: '180',
        image: 'assets/images/models/image 4.png',
      ),
      ProductModel(
        name: 'Gray coat and white T-sh..',
        price: '120',
        image: 'assets/images/models/image44.png',
      ),
      ProductModel(
        name: 'Reebok Zig Kinetica II',
        price: '130',
        image: 'assets/images/models/image 1.png',
      ),
      ProductModel(
        name: 'Reebok Zig Kinetica II',
        price: '130',
        image: 'assets/images/models/image 2.png',
      ),
      ProductModel(
        name: 'Reebok Zig Kinetica II',
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        height: 255,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Color(0xFFECECEC),
                        ),
                        child: Image.asset(item.image),
                      ),
                      Gap(13),

                      Text(
                        item.name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(6),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '\$${item.price}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(Icons.favorite_border, size: 18),
                        ],
                      ),
                    ],
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
