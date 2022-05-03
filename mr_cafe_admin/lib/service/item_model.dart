class ItemModel {
  final String? image;
  final String? itemname;
  final String? category;
  final int? price;
  final String? description;

  ItemModel(
      {required this.itemname,
      required this.category,
      required this.price,
      required this.description,
      required this.image});

  ItemModel.fromMap(Map<dynamic, dynamic> res)
      : image = res['image'],
        itemname = res['itemname'],
        category = res['category'],
        price = res['price'],
        description = res['description'];

  Map<String, dynamic> toMap() {
    return {
      // 'image': image,
      'itemname': itemname,
      'category': category,
      'price': price,
      'description': description,
    };
  }
}
