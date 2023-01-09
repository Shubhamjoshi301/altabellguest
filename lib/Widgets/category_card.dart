import 'package:altabellguest/Providers/categorywise_menu_provider.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:altabellguest/Widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryCard extends StatefulWidget {
  final bool veg;
  final bool nonveg;
  final int ind;
  final int count;

  bool showCategory;
  final Function callBack;
  CategoryCard(
      {Key? key,
      required this.veg,
      required this.nonveg,
      required this.callBack,
      required this.ind,
      required this.count,
      required this.showCategory})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // height: widget.showCategory ? widget.count * 230 : 30,
      duration: const  Duration(milliseconds: 300),
      child: Consumer<CategoryMenuProvider>(
        builder: (context, model, _) => FutureBuilder(
            future: model.fetchCategoryList({
              "menuId": "638d8ad5078cdd3f3eec3b68"
            }, {
              "refreshToken":
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZU51bWJlciI6IjkxNTY2MDE4NjYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY2NjUzNDU5Mn0.f21pIIJk1KM_uawCRuhYQCe1A_a2PkzSTu2KDyQUas0"
            }),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // print(widget.ind);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.menuList['data'][widget.ind]['_id'],
                            style: Fonts.martel_700.copyWith(fontSize: 18),
                          ),
                          GestureDetector(
                            child: const Icon(Icons.keyboard_arrow_up_sharp,
                                size: 24),
                            onTap: () {
                              // print('pressed ${widget.ind}');
                              setState(() {
                                widget.showCategory = !widget.showCategory;
                                // print(widget.showCategory);
                              });
                            },
                          ),
                        ],
                      ),
                      widget.showCategory
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 4000),
                              child: SizedBox(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: model.menuList['data'][widget.ind]
                                      ['count'],
                                  // itemCount: 1,
                                  itemBuilder: (context, index) {
                                    if (widget.veg == true &&
                                        widget.nonveg == true) {
                                      // print("non veg $nonveg");
                                      // print("veg $veg");
                                      return MenuCard(
                                        rating: 4,
                                        itemName: model.menuList['data']
                                                [widget.ind]['items'][index]
                                            ['name'],
                                        imgUrl: model.menuList['data']
                                                [widget.ind]['items'][index]
                                            ['imageUrl'],
                                        desc: model.menuList['data'][widget.ind]
                                            ['items'][index]['description'],
                                        price: model.menuList['data']
                                                [widget.ind]['items'][index]
                                            ['price'],
                                        callBack: widget.callBack,
                                        type: model.menuList['data'][widget.ind]
                                            ['items'][index]['type'],
                                        itemId: model.menuList['data']
                                            [widget.ind]['items'][index]['_id'],
                                      );
                                    } else if (widget.nonveg == true &&
                                        widget.veg == false) {
                                      // print("non veg $nonveg");
                                      // print("veg $veg");
                                      if (model.menuList['data'][widget.ind]
                                              ['items'][index]['type'] ==
                                          'NON VEG') {
                                        return MenuCard(
                                          rating: 4,
                                          itemName: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['name'],
                                          imgUrl: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['imageUrl'],
                                          desc: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['description'],
                                          price: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['price'],
                                          callBack: widget.callBack,
                                          type: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['type'],
                                          itemId: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['_id'],
                                        );
                                      } else {
                                        return Container();
                                      }
                                    } else if (widget.veg == true &&
                                        widget.nonveg == false) {
                                      // print("non veg $nonveg");
                                      // print("veg $veg");

                                      if (model.menuList['data'][widget.ind]
                                              ['items'][index]['type'] ==
                                          'VEG') {
                                        return MenuCard(
                                          rating: 4,
                                          itemName: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['name'],
                                          imgUrl: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['imageUrl'],
                                          desc: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['description'],
                                          price: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['price'],
                                          callBack: widget.callBack,
                                          type: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['type'],
                                          itemId: model.menuList['data']
                                                  [widget.ind]['items'][index]
                                              ['_id'],
                                        );
                                      } else {
                                        return Container();
                                      }
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
