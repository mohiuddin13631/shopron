import 'package:shopron/config/utils/my_images.dart';

class MyProduct {
  static List<ProductModel> categoryList = [
    ProductModel(title: "Bag", image: MyImages.bag,),
    ProductModel(title: "Electronics", image: MyImages.electronics,),
    ProductModel(title: "Headphone", image: MyImages.headphone,),
    ProductModel(title: "Mens Fashion", image: MyImages.mensFashion,),
    ProductModel(title: "Shoes", image: MyImages.shoes,),
    ProductModel(title: "Watch", image: MyImages.watch,),
  ];

  static List<ProductModel> bannerList = [
    ProductModel(title: "Banner", image: MyImages.banner_1,),
    ProductModel(title: "Banner", image: MyImages.banner_2,),
    ProductModel(title: "Banner", image: MyImages.banner_3,),
    // ProductModel(title: "Banner", image: MyImages.banner_4,),
    ProductModel(title: "Banner", image: MyImages.banner_5,),
  ];

  static List<ProductModel> companyLogoList = List.generate(6, (index) {
    return  ProductModel(title: "Samsung Watch", image: "assets/company_logo/Fictional company logo (${index+1}).png",);
  });

  static List<ProductModel> watchList = List.generate(10, (index) {
    return  ProductModel(title: "Watch", image: "assets/product/watch/watch (${index+1}).png",);
  });

  static List<ProductModel> bagList = List.generate(10, (index) {
    return  ProductModel(title: "Bag", image: "assets/product/bag/bag (${index+1}).png",);
  });

  static List<ProductModel> headPhoneList = List.generate(10, (index) {
    return  ProductModel(title: "Headphone", image: "assets/product/head_phone/headphone (${index+1}).png",);
  });

  static List<ProductModel> electronicsList = List.generate(10, (index) {
    return  ProductModel(title: "Electronics", image: "assets/product/electronics/electronics (${index+1}).png",);
  });

  static List<ProductModel> mensFashionList = List.generate(10, (index) {
    return  ProductModel(title: "Fashion", image: "assets/product/mens_fashion/Mens collections (${index+1}).png",);
  });

  static List<ProductModel> shoeList = List.generate(10, (index) {
    return  ProductModel(title: "Shoes", image: "assets/product/shoes/shoe (${index+1}).png",);
  });

  static List<ProductModel> detailsPageProductList = List.generate(3, (index) {
    return  ProductModel(title: "Fashion", image: "assets/product/mens_fashion/Mens collections (${index+1}).png",);
  });

  static List<ProductModel> mixProductList = [
    ProductModel(title: "Shoes", image: "assets/product/shoes/shoe (1).png",),
    ProductModel(title: "Watch", image: "assets/product/watch/watch (${2}).png",),
    ProductModel(title: "Fashion", image: "assets/product/mens_fashion/Mens collections (${4}).png",),
    ProductModel(title: "Electronics", image: "assets/product/electronics/electronics (${5}).png",),
    ProductModel(title: "Headphone", image: "assets/product/head_phone/headphone (${6}).png",),
    ProductModel(title: "Bag", image: "assets/product/bag/bag (${7}).png",),
    ProductModel(title: "Shoes", image: "assets/product/shoes/shoe (3).png",),
    ProductModel(title: "Headphone", image: "assets/product/head_phone/headphone (${2}).png",),
    ProductModel(title: "Electronics", image: "assets/product/electronics/electronics (${2}).png",),
    ProductModel(title: "Bag", image: "assets/product/bag/bag (${1}).png",),
  ];


  static List<ProductModel> reverseProductList = mixProductList.reversed.toList();

}

class ProductModel{
  String title;
  String image;
  ProductModel({required this.title,  required this.image});
}