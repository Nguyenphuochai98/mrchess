class ProductResponse {
  final List<Product> data;

  ProductResponse({
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    List<Product> productList = (json['data'] as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();
    productList = removeDuplicateProducts(productList);
    return ProductResponse(data: productList);
  }

  static List<Product> removeDuplicateProducts(List<Product> products) {
    Set<String> uniqueLinks = Set<String>();
    List<Product> uniqueProducts = [];

    for (Product product in products) {
      if (!uniqueLinks.contains(product.link)) {
        uniqueLinks.add(product.link!);
        uniqueProducts.add(product);
      }
    }

    return uniqueProducts;
  }

}

class Product {
  final String? image;
  final List<String>? images;
  final String? mainImage;
  final String? name;
  final double? price;
  final String? link;

  Product({
    required this.image,
    required this.images,
    required this.mainImage,
    required this.name,
    required this.price,
    required this.link,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String>? imageList ;
    if(json['images'] != null){
      imageList = (json['images'] as List).cast<String>();
    }
    return Product(
      image: json['image'],
      images: imageList ?? [],
      mainImage: json['main_image'],
      name: json['name'],
      price: int.tryParse(json['price'].toString())!  / 100000,
      link: json['link'],
    );
  }
}