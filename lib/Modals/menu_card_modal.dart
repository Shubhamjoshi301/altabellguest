class MenuCardModal {
  final int rating;
  final String itemId;
  final String itemName;
  final double price;
  double totalCost = 0;
  final String imgUrl;
  final String desc;

  int quantity = 0;
  final String type;

  MenuCardModal(
      {required this.rating,
      required this.itemId,
      required this.itemName,
      required this.price,
      required this.imgUrl,
      required this.desc,
      required this.quantity,
      required this.totalCost,
      required this.type});
}
