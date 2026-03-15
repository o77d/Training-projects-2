import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/custom_appbar.dart';
import 'package:gap/gap.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}









class _HomeState extends State<Home> {

late VideoPlayerController _controller;


@override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/wwppmm.mp4')
      ..initialize().then((_) {
        setState(() {_controller.play();
        });
      })..setLooping(true);
      

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Runway',
        prefixIcon: 'assets/svgs/bar-chart-2.svg',
        suffixIcon: 'assets/svgs/notification.svg',
      ),
      body: Stack(
        children: [
          //video
          AspectRatio(
            aspectRatio: 16 / 9,
            child: VideoPlayer(_controller)),
          
          //category
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10) ,
                  Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                ],),
              ),
            ),
          )

        ],
      ),
    );
  }
}
