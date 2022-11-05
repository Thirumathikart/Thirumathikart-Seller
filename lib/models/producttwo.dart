class ProductTwo {
  final String? image, name, parentName, details;
  int? id, parentId, quantity = 0;
  final double? price;
  ProductTwo({
    this.id,
    this.name,
    this.image,
    this.price,
    this.parentId,
    this.parentName,
    this.details,
    this.quantity,
  });
}
