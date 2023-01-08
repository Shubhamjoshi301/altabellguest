import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:altabellguest/Utils/svg_strings.dart';
import 'package:altabellguest/Widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuCard extends StatelessWidget {
  final int rating;
  final String itemName;
  final double price;
  final String imgUrl;
  final String desc;
  final Function callBack;
  const MenuCard(
      {Key? key,
      required this.rating,
      required this.itemName,
      required this.price,
      required this.imgUrl,
      required this.desc,
      required this.callBack})
      : super(key: key);

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
                    itemName,
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
                '₹ $price',
                style: Fonts.inter_400.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: SizedBox(
                  height: 40,
                  width: 180,
                  child: Text(
                    desc,
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
              SizedBox(
                height: 84,
                width: 84,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 90,
                height: 32,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24)),
                        ),
                        elevation: 10,
                        context: context,
                        builder: (context) {
                          return AddToCart(
                            callBack: callBack,
                          );
                        });
                  },
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
