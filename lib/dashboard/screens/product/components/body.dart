import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/components/search_box.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/dashboard/queries/get_all_products.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/category_list.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/product_card.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(),
        CategoryList(),
        SizedBox(height: kDefaultPadding / 2),
        Expanded(
          child: Query(
            options: QueryOptions(
                document: getAllProductsQuery,
                fetchPolicy: FetchPolicy.cacheFirst),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading && result.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final List<dynamic> listProducts = result.data['productos'];
                // _productsController.listProducts.value = listProducts;

                // Esta funcion se ejecuta al terminar de hacer build del widget, con lo anterior se ejecutaba al momento de buildear xd
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  ProductsController.to.listProducts.value = listProducts;
                });
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    Container(child: Obx(
                      () {
                        return ProductsController.to.listProducts.length <= 0
                            ? Container(
                                child: Center(
                                  child: Text(
                                      'No existe productos de esta categoria'),
                                ),
                              )
                            : Container(
                                child: ListView.builder(
                                  itemCount: ProductsController
                                      .to.listProducts.value.length,
                                  itemBuilder: (context, index) => ProductCard(
                                    itemIndex: index,
                                    product: ProductsController
                                        .to.listProducts.value[index],
                                    press: () {
                                      Get.toNamed(AppRoutes.productDetails,
                                          arguments: [
                                            ProductsController.to.listProducts
                                                .value[index]['id'],
                                            ProductsController.to.listProducts
                                                .value[index]['precio']
                                          ]);
                                    },
                                  ),
                                ),
                              );
                      },
                    ))
                  ],
                );
              }
            },
          ),
        )
      ],
    );
  }
}
