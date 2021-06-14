import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:probardispositivofisico/app_routing/routing.dart';
import 'package:probardispositivofisico/history/body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 2), () {});
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        automaticallyImplyLeading: false,
        actions: [
          // SizedBox(
          //   width: 100,
          //   child: TextFormField(
          //     onChanged: (string) {
          //       timer.cancel();
          //       timer = Timer(Duration(seconds: 2), () {
          //         print(string);
          //       });
          //     },
          //   ),
          // ),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Get.offAll(ProductsScreen());
                Get.offAndToNamed(AppRoutes.home);
              })
        ],
      ),
      body: Body(),
    );
  }
}
