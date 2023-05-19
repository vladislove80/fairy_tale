import 'package:fairy_tale/theme/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChapterWidget extends StatelessWidget {
  const ChapterWidget({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) => Container(
      color: const Color(0xffF6F8F9),
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(IconAssets.chevronLeft),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xff7D8387),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SvgPicture.asset(IconAssets.chevronRight),
            ],
          ),
        ),
      ),
    );
}
