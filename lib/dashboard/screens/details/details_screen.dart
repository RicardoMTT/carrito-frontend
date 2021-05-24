import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:probardispositivofisico/constants.dart';
import 'package:probardispositivofisico/dashboard/screens/details/body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Back',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
        ),
        body: Body(
          id: arguments[0],
          price: arguments[1],
        ));
  }
}
