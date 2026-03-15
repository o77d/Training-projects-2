import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/widgets/animation_line.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => (Home())),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: SvgPicture.asset('assets/logo/Runway.svg', width: 188)),
          Gap(10),
          AnimationLine(),
        ],
      ),
    );
  }
}
