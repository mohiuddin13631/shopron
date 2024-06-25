import 'package:flutter_prime/core/utils/my_images.dart';

class MyProduct {
  static List<ProductModel> categoryList = [
    ProductModel(title: "Bag", image: MyImages.bag,),
    ProductModel(title: "Electronics", image: MyImages.electronics,),
    ProductModel(title: "Headphone", image: MyImages.headphone,),
    ProductModel(title: "Mens Fashion", image: MyImages.mensFashion,),
    ProductModel(title: "Shoes", image: MyImages.shoes,),
    ProductModel(title: "Watch", image: MyImages.watch,),
  ];

  static List<ProductModel> watchList = List.generate(10, (index) {
    return  ProductModel(title: "Samsung Watch", image: "assets/product/watch/watch (${index+1}).png",);
  });

  static List<ProductModel> bagList = List.generate(10, (index) {
    return  ProductModel(title: "Samsung Watch", image: "assets/product/bag/bag (${index+1}).png",);
  });

  static List<ProductModel> headPhoneList = List.generate(10, (index) {
    return  ProductModel(title: "Samsung Watch", image: "assets/product/head_phone/headphone (${index+1}).png",);
  });

  static List<ProductModel> electronicsList = List.generate(10, (index) {
    return  ProductModel(title: "Samsung Watch", image: "assets/product/electronics/electronics (${index+1}).png",);
  });

  static List<ProductModel> mensFashionList = List.generate(10, (index) {
    return  ProductModel(title: "Samsung Watch", image: "assets/product/mens_fashion/Mens collections (${index+1}).png",);
  });

  static List<ProductModel> shoeList = List.generate(10, (index) {
    return  ProductModel(title: "Samsung Watch", image: "assets/product/shoes/shoe (${index+1}).png",);
  });

}

class ProductModel{
  String title;
  String image;
  ProductModel({required this.title,  required this.image});
}