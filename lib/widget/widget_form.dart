// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetForm extends StatelessWidget {
  const WidgetForm({
    Key? key,
    required this.label,
    required this.changeFunc,
    this.textInputType,
    this.obsecu,
    this.suffixWidget,
  }) : super(key: key);

  final String label;
  final Function(String) changeFunc;
  final TextInputType? textInputType;
  final bool? obsecu;
  final Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        obscureText: obsecu ?? false,
        keyboardType: textInputType,
        onChanged: changeFunc,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          border: const OutlineInputBorder(), suffixIcon: suffixWidget,
          labelText: label,
          
        ),
      ),
    );
  }
}
