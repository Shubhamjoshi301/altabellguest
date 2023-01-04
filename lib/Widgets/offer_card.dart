import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:altabellguest/Utils/svg_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferCard extends StatelessWidget {
  final String offer;
  final String desc;
  const OfferCard({Key? key, required this.offer, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorPalette.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                offer,
                style: Fonts.inter_700.copyWith(
                  color: ColorPalette.landingBlack,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                desc,
                style: Fonts.inter_700.copyWith(
                  color: ColorPalette.landingBlack,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          SvgPicture.string(SvgStrings.spa1),
        ],
      ),
    );
  }
}
