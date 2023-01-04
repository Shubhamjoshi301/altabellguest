import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Widgets/home_circle.dart';
import 'package:flutter/material.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(gradient: ColorPalette.bgGradient),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
          child: Column(
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
                    inactiveColor: const Color.fromRGBO(217, 124, 255, 0.09),
                    activeColor: const Color.fromRGBO(217, 124, 255, 0.09),
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
                    style: Fonts.inter_700
                        .copyWith(color: ColorPalette.ug1, fontSize: 16),
                  ),
                ],
              ),
              Text(
                "Room no. 201,202",
                style: Fonts.inter_400
                    .copyWith(color: ColorPalette.landingBlack, fontSize: 12),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 33),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}