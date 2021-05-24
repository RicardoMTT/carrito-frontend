import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/components/search_delegate.dart';
import 'package:probardispositivofisico/dashboard/screens/details/details_screen.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class SearchBox extends StatelessWidget {
  SearchBox({
    Key key,
  }) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductsController _productsController = Get.find<ProductsController>();

    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.0)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onTap: () async {
          List<dynamic> products = _productsController.listProducts.value;
          List<String> names = [];
          products.forEach((element) {
            names.add(element['nombre']);
          });
          final name =
              await showSearch(context: context, delegate: NameSearch(names));

          var item;
          products.forEach((element) {
            print("ELEEMENTO $element");
            if (element['nombre'] == name) {
              item = element;
            }
          });

          Get.toNamed(AppRoutes.productDetails, arguments: [
            item['id'],
            item['precio'],
          ]);
          // Get.to(() => DetailsScreen(), arguments: [
          //   item['id'],
          //   item['precio'],
          // ]);
        },
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: SvgPicture.asset('assets/icons/search.svg'),
            hintText: 'Search'),
      ),
    );
  }
}
