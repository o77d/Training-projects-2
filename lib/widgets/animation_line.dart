import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationLine extends StatefulWidget {
  @override
  _AnimationLineState createState() => _AnimationLineState();
}

class _AnimationLineState extends State<AnimationLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [_controller.value, 1.0],
                colors: [Colors.transparent, Colors.black],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: SvgPicture.asset('assets/logo/Rectangle 9.svg'),
          );
        },
      ),
    );
  }
}
