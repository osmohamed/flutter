import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/login.dart';
class textFormField extends StatelessWidget {
  textFormField({super.key,this.hintText,this.onChanged,this.labelText});
String? email,password;
String? hintText;
 String? labelText;
Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return
    TextFormField(
      onChanged: onChanged,
      validator: (data) {
        if (data!.isEmpty) return 'Required';
        // return 'Required';
      },


    decoration: InputDecoration(
    labelText: labelText,
    hintText: hintText,
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20))),
    );
  }
}
