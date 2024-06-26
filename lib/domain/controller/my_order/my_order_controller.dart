import 'package:shopron/domain/product/my_product.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController{

  String transectionId = "DW2458967847874";

  int productAmount = 05;

  List<String> orderStatus = ["Delivery","Canceled","In Progress"];

  List<OrderHistoryListItemModel> generateOrderHistoryList() {
    return List<OrderHistoryListItemModel>.generate(10, (index) {
      return OrderHistoryListItemModel(
        orderNumber: 'ON$index',
        orderId: 'ID$index',
        itemTitle: 'Item $index',
        price: '\$${(index + 1) * 10}',
        totalItem: '${index + 1}',
        status: index % 2 == 0 ? 'Delivered' : 'Pending',
        itemImage: MyProduct.shoeList[index].image,
        storeName: 'Sorel',
        date: '2024-06-0${index + 1}',
        index: index,
      );
    });
  }

   List<OrderHistoryListItemModel> orderHistoryList = [];
  void loadData() {
    orderHistoryList = generateOrderHistoryList();
  }

}

class OrderHistoryListItemModel {
  final String orderNumber;
  final String orderId;
  final String itemTitle;
  final String price;
  final String totalItem;
  final String status;
  final String itemImage;
  final String storeName;
  final String date;
  final int index;

  OrderHistoryListItemModel({
    required this.orderNumber,
    required this.orderId,
    required this.itemTitle,
    required this.price,
    required this.totalItem,
    required this.status,
    required this.itemImage,
    required this.storeName,
    required this.date,
    required this.index,
  });
}