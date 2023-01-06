import 'package:altabellguest/Providers/user_provider.dart';
import 'package:altabellguest/Utils/svg_strings.dart';
import 'package:altabellguest/Widgets/offer_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Widgets/home_circle.dart';
import 'package:flutter/material.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool status = false;
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
                          FlutterSwitch(
                            width: 30.0,
                            height: 16.0,
                            value: status,
                            borderRadius: 10,
                            padding: 1,
                            toggleSize: 12,
                            inactiveColor:
                                const Color.fromRGBO(217, 124, 255, 0.09),
                            activeColor:
                                const Color.fromRGBO(217, 124, 255, 0.09),
                            toggleColor: ColorPalette.ug1,
                            switchBorder: Border.all(
                              color: ColorPalette.ug1,
                              width: 3.0,
                            ),
                            onToggle: (val) {
                              setState(
                                () {
                                  status = val;
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Text(
                            "DND",
                            style: Fonts.inter_700.copyWith(
                                color: ColorPalette.ug1, fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        'Room no. $roomNumbers',
                        style: Fonts.inter_400.copyWith(
                            color: ColorPalette.landingBlack, fontSize: 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 27, vertical: 33),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                HomeCircle(
                                  img: 'Assets/Images/food.jpg',
                                  title: 'Food',
                                ),
                                HomeCircle(
                                  img: 'Assets/Images/food.jpg',
                                  title: 'Services',
                                ),
                                HomeCircle(
                                  img: 'Assets/Images/food.jpg',
                                  title: 'Amenities',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                HomeCircle(
                                  img: 'Assets/Images/food.jpg',
                                  title: 'Explore',
                                ),
                                HomeCircle(
                                  img: 'Assets/Images/food.jpg',
                                  title: 'Transport',
                                ),
                                HomeCircle(
                                  img: 'Assets/Images/food.jpg',
                                  title: 'Other',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                                  fontSize: 14,
                                  color: ColorPalette.landingBlack),
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
                                  fontSize: 14,
                                  color: ColorPalette.landingBlack),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Offers Created for you',
                        style: Fonts.inter_400.copyWith(
                          fontSize: 14,
                          color: ColorPalette.landingBlack,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            OfferCard(offer: "Get ₹700", desc: "SPA discount"),
                            OfferCard(offer: "Get ₹700", desc: "SPA discount"),
                            OfferCard(offer: "Get ₹700", desc: "SPA discount"),
                            OfferCard(offer: "Get ₹700", desc: "SPA discount"),
                            OfferCard(offer: "Get ₹700", desc: "SPA discount"),
                          ],
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
