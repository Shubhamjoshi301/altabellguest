import 'package:altabellguest/Providers/user_provider.dart';
import 'package:altabellguest/Utils/color_pallete.dart';
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
  bool veg = false;
  bool nonveg = false;
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
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(gradient: ColorPalette.bgGradient),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
          child: Consumer<UserProvider>(
            builder: (context, model, _) => FutureBuilder(
              future: model.fetchData({
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
                    rooms.add(
                        model.userData['data']['guest']['rooms'][i]['number']);
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
                                fontSize: 18, color: ColorPalette.landingBlack),
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
                                fontSize: 12, color: ColorPalette.completed),
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
                                fontSize: 12, color: ColorPalette.landingred),
                          )
                        ],
                      ),
                      Flexible(
                        child: SizedBox(
                          // height: 4000,
                          child: ListView(
                            children: const [
                              MenuCard(
                                rating: 4,
                              ),
                              MenuCard(
                                rating: 4,
                              ),
                              MenuCard(
                                rating: 4,
                              ),
                              MenuCard(
                                rating: 4,
                              ),
                              MenuCard(
                                rating: 4,
                              ),
                              MenuCard(
                                rating: 4,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
