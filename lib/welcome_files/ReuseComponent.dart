import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  Function? onSubmited,
  Function? onChange,
  required String lable,
  required IconData prefix,
  String? hintext,
}) =>
    TextFormField(
      onFieldSubmitted: onSubmited!(),
      onChanged: onChange!(),
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          prefixIcon: Icon(prefix),
          fillColor: Colors.grey.withAlpha(200),
          filled: true,
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.4),
              borderRadius: BorderRadius.circular(15.0)),
          hintText: hintext,
          labelText: lable,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          )),
      validator: validate(),
    );
