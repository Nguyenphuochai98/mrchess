class ProductResponse {
  final List<Product> data;

  ProductResponse({
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    List<Product> productList = (json['data'] as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return ProductResponse(data: productList);
  }
}

class Product {
  final String image;
  final List<String> images;
  final String mainImage;
  final String name;
  final int price;
  final String link;

  Product({
    required this.image,
    required this.images,
    required this.mainImage,
    required this.name,
    required this.price,
    required this.link,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String> imageList = (json['images'] as List).cast<String>();

    return Product(
      image: json['image'],
      images: imageList,
      mainImage: json['main_image'],
      name: json['name'],
      price: json['price'],
      link: json['link'],
    );
  }
}