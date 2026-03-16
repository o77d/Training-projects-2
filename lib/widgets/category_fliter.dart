import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // first section
    Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Row(
          children: [
            Text(
              'Sart by',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Gap(10),
            SvgPicture.asset('assets/svgs/Frame 39639.svg'),
            Spacer(),
            SvgPicture.asset('assets/svgs/lucide_settings-2.svg'),
            Gap(10),
            Text(
              'Filter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Gap(20),
            SvgPicture.asset('assets/svgs/ion_grid-outline.svg'),
            Gap(20),
            SvgPicture.asset(
              'assets/svgs/solar_users-group-rounded-outline.svg',
            ),
          ],
        ),
      ),
    );
  }
}
