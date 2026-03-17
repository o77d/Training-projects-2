import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product_model.dart';
import 'package:flutter_application_2/widgets/category_fliter.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:gap/gap.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, this.image, this.name, this.price});
  final String? image, name, price;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Delay showing the bottom sheet until after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.17,
          minChildSize: 0.17,
          maxChildSize: 0.8,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return bottomWidget(scrollController, widget.name, widget.price);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Men',
        prefixIcon: 'assets/svgs/arrow-left.svg',
        suffixIcon: 'assets/svgs/Vector.svg',
        prefixIconOnTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CategoryFilter(),
            Gap(13),
            //image
            Stack(
              children: [
                SizedBox(
                  width: 250,
                  height: 600,

                  child: Image.asset(widget.image.toString()),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  left: 10,

                  child: Image.asset('assets/images/Ellipse 2.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// bottom sheet widget
Widget bottomWidget(scroll, name, price) {
  return Container(
    height: 160,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: ListView(
      controller: scroll,
      children: [
        Center(
          child: Container(
            width: 42,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
          ),
        ),
        Gap(10),
        Text(
          name.toString(),
          maxLines: 1,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "\$${price}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Icon(Icons.favorite_border, size: 18),
                Gap(10),
                Text(
                  "450",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
        Gap(20),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

],)],
          ),
        ),
      ],
    ),
  );
}
