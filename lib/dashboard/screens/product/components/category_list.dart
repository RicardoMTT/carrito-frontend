import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:flutter/material.dart';
import 'package:probardispositivofisico/dashboard/queries/get_all_products.dart';
import 'package:probardispositivofisico/dashboard/queries/get_categories.dart';
import 'package:probardispositivofisico/dashboard/queries/get_products_by_category.dart';
import 'package:probardispositivofisico/dashboard/screens/product/components/products_controller.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key key}) : super(key: key);

  //List categories = ['All', 'Sofaaa', 'Parking', 'Test', 'Otro'];

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: getAllCategoryQuery,
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading && result.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final List<dynamic> categories = result.data['categorias'];
        return Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          height: 30,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () async {
                ProductsController.to.itemSelected.value = index;
                print("ITEMS ${ProductsController.to.itemSelected.value}");
                final _client = Get.find<GraphQLClient>();

                print(categories[index]['id']);
                if (categories[index]['nombre'] == 'Todos') {
                  final _request = QueryOptions(
                    document: getAllProductsQuery,
                  );
                  final _resp = await _client.query(_request);
                  ProductsController.to.listProducts.value =
                      _resp.data['productos'];
                } else {
                  final _request = QueryOptions(
                    document: getProductsByCategoryQuery,
                    variables: {"idCategoria": categories[index]['id']},
                  );

                  final _resp = await _client.query(_request);
                  print(_resp.data['productos']);

                  ProductsController.to.listProducts.value =
                      _resp.data['productos'];
                }
              },
              child: Obx(() => Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                        color: index == ProductsController.to.itemSelected.value
                            ? Colors.white.withOpacity(0.4)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Text(
                      categories[index]['nombre'],
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
