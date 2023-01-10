import 'package:altabellguest/Food/order_summary.dart';
import 'package:altabellguest/Modals/menu_card_modal.dart';
import 'package:altabellguest/Modals/orders_list_model.dart';
import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter/material.dart';

class CartBottomSheet extends StatelessWidget {
  final int itemCount;
  final double totalPrice;
  final Function updateCartCallback;
  final OrdersListModel itemsInCart;
  const CartBottomSheet(
      {Key? key,
      required this.itemCount,
      required this.totalPrice,
      required this.itemsInCart, required this.updateCartCallback})
      : super(key: key);

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
            Text('$itemCount item Added $totalPrice',
                style: Fonts.inter_400
                    .copyWith(color: ColorPalette.white, fontSize: 14)),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderSummary(
                        itemsInCart: itemsInCart, callback: updateCartCallback),
                  ),
                );
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
