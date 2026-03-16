import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.prefixIcon,
    required this.suffixIcon,
  });
  final String title;
  final String prefixIcon;
  final String suffixIcon;

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0.0,
      scrolledUnderElevation: 0.0,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(prefixIcon, width: 24),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(suffixIcon, width: 20),
        ],
      ),
    );
  }
}
