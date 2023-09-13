import 'package:flutter/material.dart';

Widget text(String text) {
  return Text(text);
}

Widget texfield(TextEditingController nameController, String hintText) {
  return TextFormField(
    controller: nameController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hintText,
    ),
  );
}

Widget button(String buttonName, String buttonType, Function()? func) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      minimumSize: const Size.fromHeight(50),
    ),
    onPressed: func,
    child: const Text(
      'Submit',
      style: TextStyle(fontSize: 24),
    ),
  );
}
