import 'package:altabellguest/Modals/menu_card_modal.dart';
import 'package:altabellguest/Modals/orders_list_model.dart';
import 'package:altabellguest/Providers/orderProvider.dart';
import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:altabellguest/Utils/svg_strings.dart';
import 'package:altabellguest/Widgets/order_cart.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class OrderSummary extends StatefulWidget {
  final OrdersListModel itemsInCart;
  final Function callback;
  const OrderSummary(
      {Key? key, required this.itemsInCart, required this.callback})
      : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  void getTotalCost(double totalCheckout, bool add) {
    setState(() {
      if (add) {
        widget.itemsInCart.checkOutCost += totalCheckout;
      } else {
        widget.itemsInCart.checkOutCost -= totalCheckout;
      }
      print(widget.itemsInCart.checkOutCost);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(itemsInCart);
    List temp = [];
    double sum = 0;
    for (int i = 0; i < widget.itemsInCart.noOfItems; i++) {
      temp.add({
        'menuItem': widget.itemsInCart.orders[i].itemName,
        'quantity': widget.itemsInCart.orders[i].quantity
      });
      sum += widget.itemsInCart.orders[i].totalCost;
    }
    Map order = {
      "hotel": "638f5baed0e017109959fe34",
      "number": 9,
      "room": "63555012cca13913dd43135e",
      "guest": "638f5baed0e017109959fe34",
      "orderItems": temp,
      "amount": sum,
      "staff": "6377a4a41e0a8c07f0d0bd1c",
      "isService": false
    };
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 86),
              decoration:
                  const BoxDecoration(gradient: ColorPalette.bgGradient),
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: ColorPalette.paleYellow,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Your loundry is on the way',
                          style: Fonts.inter_400.copyWith(
                              fontSize: 14, color: ColorPalette.landingBlack),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                        SvgPicture.string(SvgStrings.acute),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '15 mins',
                          style: Fonts.inter_400.copyWith(
                              fontSize: 14, color: ColorPalette.landingBlack),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorPalette.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order summary',
                          style: Fonts.martel_700.copyWith(fontSize: 18),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.itemsInCart.noOfItems,

                            // itemCount: 1,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                child: Ordercard(
                                  cardModal: widget.itemsInCart.orders[index],
                                  totalCost: getTotalCost,
                                  // itemName: itemsInCart[index].itemName,
                                  // price: itemsInCart[index].price,
                                  // quantity: itemsInCart[index].quantity,
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    // width: 358,
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorPalette.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose room no.',
                          style: Fonts.martel_700.copyWith(fontSize: 18),
                        ),
                        Container(
                          width: 358,
                          child: Row(children: [
                            Container(
                              height: 38,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '201',
                                style: Fonts.martel_700.copyWith(fontSize: 18),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '201',
                                style: Fonts.martel_700.copyWith(fontSize: 18),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                '201',
                                style: Fonts.martel_700.copyWith(fontSize: 18),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorPalette.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add cooking instructions',
                          style: Fonts.martel_700.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorPalette.lightestgray,
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.text,
                            // decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorPalette.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Billing Summary',
                          style: Fonts.martel_700.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            // color: ColorPalette.lightestgray,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Item total",
                                    style:
                                        Fonts.inter_400.copyWith(fontSize: 14),
                                  ),
                                  Text('₹${widget.itemsInCart.checkOutCost}')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tax",
                                    style:
                                        Fonts.inter_400.copyWith(fontSize: 14),
                                  ),
                                  Text(
                                      '₹${widget.itemsInCart.checkOutCost * 0.15}')
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount",
                                    style:
                                        Fonts.inter_400.copyWith(fontSize: 14),
                                  ),
                                  Text(
                                      '₹${widget.itemsInCart.checkOutCost * 0.1}')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: ColorPalette.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cancellation policy',
                          style: Fonts.martel_700.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          child: Text(
                            'Once an order is placed it can’t be cancelled. Read more here.',
                            style: Fonts.inter_400.copyWith(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          List temp = [];
                          double sum = 0;
                          for (int i = 0;
                              i < widget.itemsInCart.noOfItems;
                              i++) {
                            temp.add({
                              'menuItem': widget.itemsInCart.orders[i].itemId,
                              'quantity': widget.itemsInCart.orders[i].quantity
                            });
                          }
                          print(
                              'in orderSummary: ${widget.itemsInCart.checkOutCost}, ${widget.itemsInCart.noOfItems}');
                          OrderProvider().placeOrder({
                            "hotel": "638f5baed0e017109959fe34",
                            "number": 9,
                            "room": "63555012cca13913dd43135e",
                            "guest": "638f5baed0e017109959fe34",
                            "orderItems": temp,
                            "amount": widget.itemsInCart.checkOutCost,
                            "staff": "6377a4a41e0a8c07f0d0bd1c",
                            "isService": false
                          }, {
                            "refreshToken":
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY2NjUzNDU5Mn0.f21pIIJk1KM_uawCRuhYQCe1A_a2PkzSTu2KDyQUas0"
                          });
                        });
                        temp = [];
                        for (var item in widget.itemsInCart.orders) {
                          item.quantity = 0;
                          item.totalCost = 0;
                        }
                        widget.itemsInCart.checkOutCost = 0;
                        widget.itemsInCart.noOfItems = 0;
                        widget.callback();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 56,
                        // width: 190,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromRGBO(84, 3, 117, 1)),
                        child: Text(
                          'Place Order',
                          style: Fonts.inter_400.copyWith(
                              fontSize: 16, color: ColorPalette.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
