import 'package:altabellguest/Providers/menu_card_provider.dart';
import 'package:altabellguest/Providers/user_provider.dart';
import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Widgets/bottom_sheet.dart';
import 'package:altabellguest/Widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  bool veg = true;
  bool nonveg = true;
  bool inCart = false;
  void callBack() {
    setState(() {
      print('incartinevrt');
      inCart = !inCart;
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
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
                          Flexible(
                            child: SizedBox(
                              // height: 4000,
                              child: Consumer<MenuCardProvider>(
                                builder: (context, model, _) => FutureBuilder(
                                    future: model.fetchMenuList({
                                      "menuId": "638d8ad5078cdd3f3eec3b68"
                                    }, {
                                      "refreshToken":
                                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY2NjUzNDU5Mn0.f21pIIJk1KM_uawCRuhYQCe1A_a2PkzSTu2KDyQUas0"
                                    }),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        // List MenuItems = [];
                                        // for (var i = 0;
                                        //     i < model.menuList.length;
                                        //     i++) {
                                        //   MenuItems.add(
                                        //     {
                                        //       'menuId': model.menuList[i]['_id'],
                                        //       'name': model.menuList[i]['_id']
                                        //     },
                                        //   );
                                        // }
                                        // print(model.menuList['data'].length);
                                        return ListView.builder(
                                          itemCount:
                                              model.menuList['data'].length,
                                          itemBuilder: (context, index) {
                                            if (veg == true && nonveg == true) {
                                              // print("non veg $nonveg");
                                              // print("veg $veg");
                                              return MenuCard(
                                                rating: 4,
                                                itemName: model.menuList['data']
                                                    [index]['name'],
                                                imgUrl: model.menuList['data']
                                                    [index]['imageUrl'],
                                                desc: model.menuList['data']
                                                    [index]['description'],
                                                price: model.menuList['data']
                                                    [index]['price'],
                                                callBack: callBack,
                                                type: model.menuList['data']
                                                    [index]['type'],
                                              );
                                            } else if (nonveg == true &&
                                                veg == false) {
                                              // print("non veg $nonveg");
                                              // print("veg $veg");
                                              if (model.menuList['data'][index]
                                                      ['type'] ==
                                                  'NON VEG') {
                                                return MenuCard(
                                                  rating: 4,
                                                  itemName:
                                                      model.menuList['data']
                                                          [index]['name'],
                                                  imgUrl: model.menuList['data']
                                                      [index]['imageUrl'],
                                                  desc: model.menuList['data']
                                                      [index]['description'],
                                                  price: model.menuList['data']
                                                      [index]['price'],
                                                  callBack: callBack,
                                                  type: model.menuList['data']
                                                      [index]['type'],
                                                );
                                              } else {
                                                return Container();
                                              }
                                            } else if (veg == true &&
                                                nonveg == false) {
                                              // print("non veg $nonveg");
                                              // print("veg $veg");

                                              if (model.menuList['data'][index]
                                                      ['type'] ==
                                                  'VEG') {
                                                return MenuCard(
                                                  rating: 4,
                                                  itemName:
                                                      model.menuList['data']
                                                          [index]['name'],
                                                  imgUrl: model.menuList['data']
                                                      [index]['imageUrl'],
                                                  desc: model.menuList['data']
                                                      [index]['description'],
                                                  price: model.menuList['data']
                                                      [index]['price'],
                                                  callBack: callBack,
                                                  type: model.menuList['data']
                                                      [index]['type'],
                                                );
                                              } else {
                                                return Container();
                                              }
                                            } else {
                                              return Container();
                                            }
                                          },
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                              ),
                            ),
                          ),
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
              child: inCart ? const CartBottomSheet() : Container(),
            )
          ],
        ),
      ),
    );
  }
}
