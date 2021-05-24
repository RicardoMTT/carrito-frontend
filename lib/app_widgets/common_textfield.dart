import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class CommonTextField extends StatefulWidget {
  final String placeholder;
  final TextInputType keyBoardType;
  final bool isPassword;
  final TextFieldBloc textFieldBloc;
  final IconData icon;
  const CommonTextField(
      {Key key,
      this.placeholder,
      this.icon,
      this.textFieldBloc,
      this.keyBoardType,
      this.isPassword = false})
      : super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  final _key = GlobalKey<FormFieldState>();

  GlobalKey<FormFieldState> get inputKey => _key;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      cubit: widget.textFieldBloc,
      builder: (context, FieldBlocState state) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: TextFieldBlocBuilder(
            key: _key,
            keyboardType: widget.keyBoardType,
            suffixButton: widget.isPassword ? SuffixButton.obscureText : null,
            textFieldBloc: widget.textFieldBloc,
            errorBuilder: (context, error) => null,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              prefixIcon: Icon(widget.icon),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
