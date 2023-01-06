import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:altabellguest/Utils/svg_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuCard extends StatelessWidget {
  final int rating;
  const MenuCard({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: ColorPalette.white),
      height: 168,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.string(SvgStrings.vegMark),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Paneer Masala',
                    style: Fonts.inter_400.copyWith(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  for (var i = 0; i < 5; i++)
                    i < rating
                        ? const Icon(
                            Icons.star,
                            color: ColorPalette.ug2,
                            size: 18,
                          )
                        : const Icon(
                            Icons.star_border,
                            color: ColorPalette.lightestgray,
                            size: 18,
                          )
                ],
              ),
              const SizedBox(height: 16),
              Text(
                '₹ 399',
                style: Fonts.inter_400.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: SizedBox(
                  height: 40,
                  width: 180,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    overflow: TextOverflow.ellipsis,
                    style: Fonts.inter_400
                        .copyWith(color: ColorPalette.darkgray, fontSize: 12),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                  height: 84,
                  width: 84,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  child: Placeholder()),
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 90,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    elevation: 20,
                    primary: ColorPalette.white,
                    shadowColor: const Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                  child: Text(
                    'Add',
                    style: Fonts.inter_400
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
