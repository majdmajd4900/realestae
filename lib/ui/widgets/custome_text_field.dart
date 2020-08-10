import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function validationFun;
  final Function saveFormField;
  final TextInputType textInputType;
  CustomTextField({this.label, this.validationFun, this.saveFormField,this.textInputType});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: textInputType ,
      onSaved: (newValue) => saveFormField(newValue),
      validator: (value) => validationFun(value),
      decoration: InputDecoration(
          fillColor: Colors.blueAccent,
          filled: true,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}