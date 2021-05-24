import 'package:get/get.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}
