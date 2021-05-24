import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:probardispositivofisico/app_widgets/common_textfield.dart';
import 'package:probardispositivofisico/authentication/screens/login/form_bloc.dart';
import 'package:probardispositivofisico/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginFormBloc>(
      create: (_) => LoginFormBloc(),
      child: Builder(
        builder: (context) {
          final _formBloc = BlocProvider.of<LoginFormBloc>(context);

          return Container(
            width: 300,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    )),
                CommonTextField(
                  textFieldBloc: _formBloc.email,
                  icon: Icons.people,
                  placeholder: 'Usuario',
                  keyBoardType: TextInputType.emailAddress,
                ),
                CommonTextField(
                  textFieldBloc: _formBloc.password,
                  icon: Icons.security,
                  placeholder: 'Contraseña',
                  isPassword: true,
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  onPressed: () {
                    _formBloc.submit();
                  },
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
