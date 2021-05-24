import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CommonSuccessDialog extends StatelessWidget {
  final String messageText;
  final String acceptText;

  const CommonSuccessDialog({
    Key key,
    this.messageText = 'Éxito',
    this.acceptText = 'Aceptar',
  }) : super(key: key);

  static Future<bool> show({String messageText, String acceptText}) {
    return Get.dialog(CommonSuccessDialog(
      acceptText: acceptText,
      messageText: messageText,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          width: 326,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 39,
              ),
              Image.asset(
                'assets/images/check.png',
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                messageText,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  height: 54,
                  decoration: const BoxDecoration(),
                  child: FlatButton(
                    onPressed: () {
                      Get.back(result: true);
                    },
                    child: Text(acceptText,
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 18)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
