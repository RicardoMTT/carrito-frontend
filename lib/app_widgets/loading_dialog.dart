import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialog extends StatelessWidget {
  static void show({
    Key key,
  }) =>
      Get.dialog(LoadingDialog(key: key), barrierDismissible: false);

  static void hide() => Get.back();
  const LoadingDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(20.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
