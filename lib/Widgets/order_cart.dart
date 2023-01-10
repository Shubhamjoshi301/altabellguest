import 'package:altabellguest/Modals/menu_card_modal.dart';
import 'package:altabellguest/Utils/color_pallete.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:flutter/material.dart';

class Ordercard extends StatefulWidget {
  final MenuCardModal cardModal;
  final Function totalCost;
  // final String itemName;
  // int quantity;
  // double price;

  const Ordercard(
      {Key? key,
      // required this.itemName,
      // required this.quantity,
      // required this.price,
      required this.cardModal,
      required this.totalCost})
      : super(key: key);

  @override
  State<Ordercard> createState() => _OrdercardState();
}

class _OrdercardState extends State<Ordercard> {
  late double originalPrice = widget.cardModal.price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.cardModal.itemName,
                  style: Fonts.inter_400.copyWith(fontSize: 16),
                ),
              ),
              Text(
                'Half(with Mayo dip...)',
                style: Fonts.inter_400
                    .copyWith(fontSize: 16, color: ColorPalette.lightestgray),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Edit',
                  style: Fonts.inter_400.copyWith(
                    fontSize: 13,
                    color: Color(0xff540375),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                  ),
                ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 33,
                        height: 33,
                        child:  Icon(
                          Icons.horizontal_rule,
                          color: Color(0xff000000),
                          size: 24,
                        ),
                      ),
                      onTap: () {
                        if (widget.cardModal.quantity > 0) {
                          setState(() {
                            widget.cardModal.quantity -= 1;
                            widget.cardModal.totalCost -=
                                widget.cardModal.price;
                          });
                          widget.totalCost(widget.cardModal.price,false);
                        }
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 33,
                      height: 33,
                      child: Text(widget.cardModal.quantity.toString()),
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 33,
                        height: 33,
                        child: Icon(
                          color:  Color(0xff000000),
                          Icons.add,
                          size: 24,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          widget.cardModal.quantity += 1;
                          widget.cardModal.totalCost += widget.cardModal.price;
                          
                        });
                        widget.totalCost(widget.cardModal.price,true);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '₹ ${widget.cardModal.totalCost}',
                style: Fonts.inter_400.copyWith(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
