import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:altabellguest/Widgets/add_to_cart.dart';
import 'package:flutter/material.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        decoration: const BoxDecoration(
          color: ColorPalette.ug1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        duration: const Duration(seconds: 10),
        curve: Curves.bounceIn,
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1 item Added',
                style: Fonts.inter_400
                    .copyWith(color: ColorPalette.white, fontSize: 14)),
            TextButton(
              onPressed: () {
                
              },
              child: Text(
                'View Cart',
                style: Fonts.inter_400
                    .copyWith(color: ColorPalette.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
