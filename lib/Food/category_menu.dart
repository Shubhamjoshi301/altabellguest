import 'package:altabellguest/Providers/categorywise_menu_provider.dart';
import 'package:altabellguest/Utils/fonts.dart';
import 'package:altabellguest/Widgets/category_card.dart';

import 'package:altabellguest/Widgets/menu_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMenu extends StatefulWidget {
  final bool veg;
  final bool nonveg;
  final Function callBack;
  const CategoryMenu(
      {Key? key,
      required this.veg,
      required this.nonveg,
      required this.callBack})
      : super(key: key);

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: model.menuList['data'].length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      showCategory: true,
                      count: model.menuList['data'][index]['count'],
                      veg: widget.veg,
                      nonveg: widget.nonveg,
                      callBack: widget.callBack,
                      ind: index,
                    );
                  },
                );
              } else {
                return Container();
              }
            }),
      ),
    );
  }
}
