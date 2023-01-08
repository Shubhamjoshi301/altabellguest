import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter/material.dart';


enum Portion { half, full }

class AddToCart extends StatefulWidget {
  final Function callBack;
  const AddToCart({Key? key, required this.callBack}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  Portion? _portion = Portion.full;

  bool? mayo = false;
  bool? tandoori = false;
  bool? aachari = false;
  bool? greenSalad = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 702,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
      decoration: const BoxDecoration(
        gradient: ColorPalette.bgGradient,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Portion',
            style: Fonts.martel_700.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Veg Hakka Noodles',
            style: Fonts.inter_400.copyWith(fontSize: 16),
          ),
          Container(
            height: 86,
            padding: const EdgeInsets.symmetric(horizontal: 34),
            margin: const EdgeInsets.only(top: 16),
            // width: 100,
            decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Row(
                      children: [
                        Text(
                          'Full',
                          style: Fonts.inter_400.copyWith(fontSize: 14),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '₹ 399',
                          style: Fonts.inter_400.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                    leading: Radio<Portion>(
                        activeColor: ColorPalette.ug1,
                        value: Portion.full,
                        groupValue: _portion,
                        onChanged: (value) {
                          setState(() {
                            _portion = value;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Row(
                      children: [
                        Text(
                          'Half',
                          style: Fonts.inter_400.copyWith(fontSize: 14),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '₹ 399',
                          style: Fonts.inter_400.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                    leading: Radio<Portion>(
                        activeColor: ColorPalette.ug1,
                        value: Portion.half,
                        groupValue: _portion,
                        onChanged: (value) {
                          setState(() {
                            _portion = value;
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            'Select add-ons',
            style: Fonts.martel_700.copyWith(fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 156,
            padding: const EdgeInsets.only(left: 34, right: 34, top: 16),
            // width: 100,
            decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                        activeColor: ColorPalette.ug1,
                        value: mayo,
                        onChanged: (value) {
                          setState(() {
                            mayo = value;
                          });
                        }),
                    Text(
                      'Mayo dip',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '₹ 20',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: ColorPalette.ug1,
                        value: tandoori,
                        onChanged: (value) {
                          setState(() {
                            tandoori = value;
                          });
                        }),
                    Text(
                      'Tandoori dip',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '₹ 20',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: ColorPalette.ug1,
                        value: aachari,
                        onChanged: (value) {
                          setState(() {
                            aachari = value;
                          });
                        }),
                    Text(
                      'Aachari dip',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '₹ 20',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: ColorPalette.ug1,
                        value: greenSalad,
                        onChanged: (value) {
                          setState(() {
                            greenSalad = value;
                          });
                        }),
                    Text(
                      'Green Salad',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '₹ 20',
                      style: Fonts.inter_400.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                widget.callBack;
                Navigator.pop(context);
              },
              child: Container(
                height: 56,
                width: 217,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorPalette.ug1,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Select and move to cart',
                  style: Fonts.inter_700
                      .copyWith(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
