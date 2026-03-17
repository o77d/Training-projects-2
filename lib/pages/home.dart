import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/category_model.dart';
import 'package:flutter_application_2/pages/categories.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = [
    CategoryModel(name: 'Women', image: 'assets/images/category/Women.png'),
    CategoryModel(name: 'Men', image: 'assets/images/category/Men.png'),
    CategoryModel(name: 'Kids', image: 'assets/images/category/Kids.png'),
    CategoryModel(name: 'Deals', image: 'assets/images/category/Deals.png'),
    CategoryModel(name: 'Home', image: 'assets/images/category/Home.png'),
  ];

  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/wwppmm.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      })
      ..setLooping(true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Runway',
        prefixIcon: 'assets/svgs/bar-chart-2.svg',
        suffixIcon: 'assets/svgs/notification.svg',
                prefixIconOnTap: () => Navigator.pop(context),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            //video
            AspectRatio(aspectRatio: 0.6, child: VideoPlayer(_controller)),

            //category
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                      Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(30),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(category.length, (index) {
                            final item = category[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 11.0),

                              child: GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => CategoriesScreen(),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(item.image, width: 75),
                                    Gap(10),
                                    Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
