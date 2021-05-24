import 'package:get/get.dart';

class ProductsController extends GetxController {
  final RxList<dynamic> listProducts = [].obs;
  final itemSelected = 0.obs;

  ProductsController();
  static ProductsController get to => Get.find();
}
