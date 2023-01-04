import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter/material.dart';

class HomeCircle extends StatelessWidget {
  final String img;
  final String title;
  const HomeCircle({Key? key, required this.img, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: ColorPalette.homecircleGradient,
            borderRadius: BorderRadius.circular(40),
          ),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(20), // Image radius
              child: Image.asset(img, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: Fonts.inter_400.copyWith(
            fontSize: 15,
            color: ColorPalette.landingBlack,
          ),
        ),
      ],
    );
  }
}
