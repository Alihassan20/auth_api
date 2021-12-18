import 'package:flutter/material.dart';

class TextFormByField extends StatelessWidget {
  TextInputType? inputTxt;
  final Color? color;
  final String? hint;

  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  TextFormByField(
      {this.color, this.hint, this.validator, this.onSaved, this.inputTxt});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          filled: true,
          fillColor: color,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.white,
              )),
          labelText: hint,
          labelStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white38),
        ),
        keyboardType: inputTxt,
        validator: validator,
        onSaved: onSaved);
  }
}
