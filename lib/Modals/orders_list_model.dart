import 'package:altabellguest/Modals/menu_card_modal.dart';

class OrdersListModel {
  List<MenuCardModal> orders;
  double checkOutCost;
  int noOfItems;

  OrdersListModel(
      {required this.orders,
      required this.checkOutCost,
      required this.noOfItems});
}
