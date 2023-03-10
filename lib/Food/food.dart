// {
//         'itemId': itemId,
//         'itemName': itemName,
//         'quantity': itemCount,
//         'itemNetPrice': currPrice,
//       }

import 'package:altabellguest/Food/category_menu.dart';
import 'package:altabellguest/Modals/menu_card_modal.dart';
import 'package:altabellguest/Modals/orders_list_model.dart';
import 'package:altabellguest/Providers/user_provider.dart';
import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FoodScreen extends StatefulWidget {
  FoodScreen({Key? key}) : super(key: key);
  int countInCart = 0;
  double totalPrice = 0;
  // List<MenuCardModal> itemsInCart = [];
  OrdersListModel itemsInCart =
      OrdersListModel(orders: [], checkOutCost: 0, noOfItems: 0);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  bool veg = true;
  bool nonveg = true;

  bool fullMenu = true;
  void callback(MenuCardModal item) {
    setState(() {
      widget.itemsInCart.orders.add(item);
      print('currprice and curritems ${item.totalCost} ${item.quantity}');
      widget.itemsInCart.checkOutCost += item.totalCost;
      widget.itemsInCart.noOfItems += item.quantity;
    });
  }



  @override
  // void initState() {
  //   Provider.of<UserProvider>(context, listen: false).fetchData({
  //     "guestId": "638f5baed0e017109959fe34"
  //   }, {
  //     "refreshToken":
  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY2NjUzNDU5Mn0.f21pIIJk1KM_uawCRuhYQCe1A_a2PkzSTu2KDyQUas0"
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration:
                  const BoxDecoration(gradient: ColorPalette.bgGradient),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 35),
              child: Consumer<UserProvider>(
                builder: (context, model, _) => FutureBuilder(
                  future: model.fetchUserData({
                    "guestId": "638f5baed0e017109959fe34"
                  }, {
                    "refreshToken":
                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY2NjUzNDU5Mn0.f21pIIJk1KM_uawCRuhYQCe1A_a2PkzSTu2KDyQUas0"
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var rooms = [];
                      for (int i = 0;
                          i < model.userData['data']['guest']['rooms'].length;
                          i++) {
                        rooms.add(model.userData['data']['guest']['rooms'][i]
                            ['number']);
                      }
                      rooms.sort();
                      String roomNumbers = '';
                      for (var i = 0; i < rooms.length - 1; i++) {
                        roomNumbers += '${rooms[i]},';
                      }
                      roomNumbers += rooms[rooms.length - 1].toString();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Radisson Blu",
                                style: Fonts.martel_700.copyWith(
                                    fontSize: 18,
                                    color: ColorPalette.landingBlack),
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 61,
                                height: 31,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 8),
                                decoration: BoxDecoration(
                                  color: ColorPalette.ug2,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '4.2',
                                      style: Fonts.inter_400.copyWith(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: ColorPalette.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Text(
                            'Room no. $roomNumbers',
                            style: Fonts.inter_400.copyWith(
                                color: ColorPalette.landingBlack, fontSize: 12),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8),
                                  height: 33,
                                  decoration: BoxDecoration(
                                    color: !fullMenu
                                        ? const Color.fromRGBO(240, 203, 255, 0)
                                        : const Color.fromRGBO(
                                            240, 203, 255, 1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Full Menu',
                                    style:
                                        Fonts.inter_400.copyWith(fontSize: 14),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    fullMenu = true;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(8),
                                  height: 33,
                                  decoration: BoxDecoration(
                                      color: fullMenu
                                          ? const Color.fromRGBO(
                                              240, 203, 255, 0)
                                          : const Color.fromRGBO(
                                              240, 203, 255, 1),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    'Recommended',
                                    style:
                                        Fonts.inter_400.copyWith(fontSize: 14),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    fullMenu = false;
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            children: [
                              FlutterSwitch(
                                width: 22.0,
                                height: 12.0,
                                value: veg,
                                borderRadius: 6,
                                padding: 0.5,
                                toggleSize: 9,
                                inactiveColor:
                                    const Color.fromRGBO(217, 124, 255, 0.09),
                                activeColor: ColorPalette.completed,
                                toggleColor: ColorPalette.completed,
                                activeToggleColor: ColorPalette.white,
                                switchBorder: Border.all(
                                  color: ColorPalette.completed,
                                  width: 2.0,
                                ),
                                onToggle: (val) {
                                  setState(
                                    () {
                                      veg = val;
                                    },
                                  );
                                },
                              ),
                              Text(
                                '  VEG',
                                style: Fonts.inter_400.copyWith(
                                    fontSize: 12,
                                    color: ColorPalette.completed),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              FlutterSwitch(
                                width: 22.0,
                                height: 12.0,
                                value: nonveg,
                                borderRadius: 6,
                                padding: 0.5,
                                toggleSize: 9,
                                inactiveColor:
                                    const Color.fromRGBO(217, 124, 255, 0.09),
                                activeColor: ColorPalette.landingred,
                                toggleColor: ColorPalette.landingred,
                                activeToggleColor: ColorPalette.white,
                                switchBorder: Border.all(
                                  color: ColorPalette.landingred,
                                  width: 2.0,
                                ),
                                onToggle: (val1) {
                                  setState(
                                    () {
                                      nonveg = val1;
                                    },
                                  );
                                },
                              ),
                              Text(
                                '  NON VEG',
                                style: Fonts.inter_400.copyWith(
                                    fontSize: 12,
                                    color: ColorPalette.landingred),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          // Expanded(
                          //   child: Consumer<MenuCardProvider>(
                          //     builder: (context, model, _) => FutureBuilder(
                          //         future: model.fetchMenuList({
                          //           "menuId": "638d8ad5078cdd3f3eec3b68"
                          //         }, {
                          //           "refreshToken":
                          //               "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY2NjUzNDU5Mn0.f21pIIJk1KM_uawCRuhYQCe1A_a2PkzSTu2KDyQUas0"
                          //         }),
                          //         builder: (context, snapshot) {
                          //           if (snapshot.hasData) {
                          //             return ListView.builder(
                          //               physics: const BouncingScrollPhysics(),
                          //               itemCount:
                          //                   model.menuList['data'].length,
                          //               itemBuilder: (context, index) {
                          //                 if (veg == true && nonveg == true) {
                          //                   // print("non veg $nonveg");
                          //                   // print("veg $veg");
                          //                   return MenuCard(
                          //                     rating: 4,
                          //                     itemName: model.menuList['data']
                          //                         [index]['name'],
                          //                     imgUrl: model.menuList['data']
                          //                         [index]['imageUrl'],
                          //                     desc: model.menuList['data']
                          //                         [index]['description'],
                          //                     price: model.menuList['data']
                          //                         [index]['price'],
                          //                     callBack: callBack,
                          //                     type: model.menuList['data']
                          //                         [index]['type'],
                          //                   );
                          //                 } else if (nonveg == true &&
                          //                     veg == false) {
                          //                   // print("non veg $nonveg");
                          //                   // print("veg $veg");
                          //                   if (model.menuList['data'][index]
                          //                           ['type'] ==
                          //                       'NON VEG') {
                          //                     return MenuCard(
                          //                       rating: 4,
                          //                       itemName: model.menuList['data']
                          //                           [index]['name'],
                          //                       imgUrl: model.menuList['data']
                          //                           [index]['imageUrl'],
                          //                       desc: model.menuList['data']
                          //                           [index]['description'],
                          //                       price: model.menuList['data']
                          //                           [index]['price'],
                          //                       callBack: callBack,
                          //                       type: model.menuList['data']
                          //                           [index]['type'],
                          //                     );
                          //                   } else {
                          //                     return Container();
                          //                   }
                          //                 } else if (veg == true &&
                          //                     nonveg == false) {
                          //                   // print("non veg $nonveg");
                          //                   // print("veg $veg");

                          //                   if (model.menuList['data'][index]
                          //                           ['type'] ==
                          //                       'VEG') {
                          //                     return MenuCard(
                          //                       rating: 4,
                          //                       itemName: model.menuList['data']
                          //                           [index]['name'],
                          //                       imgUrl: model.menuList['data']
                          //                           [index]['imageUrl'],
                          //                       desc: model.menuList['data']
                          //                           [index]['description'],
                          //                       price: model.menuList['data']
                          //                           [index]['price'],
                          //                       callBack: callBack,
                          //                       type: model.menuList['data']
                          //                           [index]['type'],
                          //                     );
                          //                   } else {
                          //                     return Container();
                          //                   }
                          //                 } else {
                          //                   return Container();
                          //                 }
                          //               },
                          //             );
                          //           } else {
                          //             return Container();
                          //           }
                          //         }),
                          //   ),
                          // ),
                          fullMenu
                              ? CategoryMenu(
                                  veg: veg, nonveg: nonveg, callBack: callback)
                              : Container(),
                          widget.countInCart > 0
                              ? const SizedBox(
                                  height: 72,
                                )
                              : Container(),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.1),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: widget.itemsInCart.noOfItems > 0
                  ? CartBottomSheet(
                      itemCount: widget.itemsInCart.noOfItems,
                      totalPrice: widget.itemsInCart.checkOutCost,
                      itemsInCart: widget.itemsInCart,
                      updateCartCallback: () {
                        setState(() {});
                      },
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
