import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/app_widgets/common_successfull_dialog.dart';
import 'package:probardispositivofisico/app_widgets/loading_dialog.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/dashboard/mutations/register_purchase.dart';
import 'package:probardispositivofisico/dashboard/queries/get_product.dart';
import 'package:probardispositivofisico/dashboard/screens/details/details_controller.dart';
import 'package:probardispositivofisico/history/screen.dart';

class Body extends StatelessWidget {
  final String id;
  final int price;
  const Body({Key key, this.id, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ProductDetailsController _productDetailsController =
        Get.put(ProductDetailsController());

    return Container(
      child: Query(
        options: QueryOptions(
          document: getProduct,
          variables: {
            'id': id,
          },
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading && result.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final _item = result.data['producto'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                        height: size.width * 0.7,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: size.width * 0.6,
                              width: size.width * 0.6,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                            ),
                            Image.network(
                              'http://192.168.1.2:1337' +
                                  _item['avatar']['url'],
                              width: size.width * 0.70,
                              height: size.height * 0.70,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _item['nombre'],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "S/. ${_item['precio'].toString()}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              color: Colors.blue,
                              shape: CircleBorder(),
                              onPressed: () {
                                _productDetailsController.counter.value++;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                            Obx(() => Container(
                                  width: 20,
                                  child: Center(
                                    child: Text(_productDetailsController
                                        .counter.value
                                        .toString()),
                                  ),
                                )),
                            MaterialButton(
                              color: Colors.blue,
                              shape: CircleBorder(),
                              onPressed: () {
                                if (_productDetailsController.counter.value ==
                                    0) {
                                  return;
                                }
                                _productDetailsController.counter.value--;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(),
                    Center(
                        child: Obx(
                      () => FlatButton(
                          minWidth: 200,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: kSecondaryColor,
                          onPressed: _productDetailsController.counter.value ==
                                  0
                              ? null
                              : () async {
                                  LoadingDialog.show();

                                  final _client = Get.find<GraphQLClient>();
                                  final total =
                                      _productDetailsController.counter.value *
                                          price;
                                  print('total $total');
                                  await _client.mutate(
                                    MutationOptions(
                                      document: registerPurchaseMutation,
                                      variables: {
                                        'cantidad': _productDetailsController
                                            .counter.value,
                                        'producto': id,
                                        'total': total
                                      },
                                      onError: (error) {
                                        print("ERRROR $error");
                                      },
                                      update: (cache, result) {
                                        print("RESULT");
                                        print(result);
                                      },
                                    ),
                                  );
                                  Future.delayed(Duration(milliseconds: 2000));
                                  LoadingDialog.hide();
                                  _productDetailsController.counter.value = 0;
                                  final _confirm =
                                      await CommonSuccessDialog.show(
                                          messageText:
                                              'Compra realizada  con éxito',
                                          acceptText: 'Listo');
                                  if (_confirm) {
                                    Get.toNamed(AppRoutes.historial);
                                    // Get.off(() => HistoryScreen());
                                  }
                                },
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.white,
                          child: Text(
                            'Comprar',
                            style: TextStyle(color: Colors.white),
                          )),
                    )),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
