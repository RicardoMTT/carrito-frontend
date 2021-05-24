import 'package:flutter/material.dart';
import 'package:probardispositivofisico/authentication/screens/login/form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          color: Colors.white,
          height: _height * 0.5,
        ),
        SafeArea(
          child: Scaffold(
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LoginForm()
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
