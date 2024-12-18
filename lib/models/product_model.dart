class ProductModel {
  final int id;
  final String barCode;
  final String name;
  final double purchasePrice;
  final double salePrice;
  final int stock;
  final String urlImage;

  ProductModel({
    required this.id,
    required this.name,
    required this.barCode,
    required this.purchasePrice,
    required this.salePrice,
    required this.stock,
    required this.urlImage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      barCode: json['barCode'],
      purchasePrice: json['purchasePrice'],
      salePrice: json['salePrice'],
      stock: json['stock'],
      urlImage: json['urlImage'],
    );
  }

  static List<ProductModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  ProductModel copyWith({
    int? id,
    String? name,
    String? barCode,
    double? purchasePrice,
    double? salePrice,
    int? stock,
    String? urlImage,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      barCode: barCode ?? this.barCode,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      salePrice: salePrice ?? this.salePrice,
      stock: stock ?? this.stock,
      urlImage: urlImage ?? this.urlImage,
    );
  }
}
