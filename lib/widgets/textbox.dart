import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  String value = "";
  String hint = "";
  TextInputType? type;
  bool obscure = false;
  TextEditingController? controller;
  MyTextBox({hint, type, controller}){
    this.hint = hint;
    this.type = type;
    this.controller = controller;
    if(type == TextInputType.visiblePassword) this.obscure = true;
    else this.obscure = false;
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (data){this.value = data;},
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width:10)
          )
      ),
    );
  }
}

