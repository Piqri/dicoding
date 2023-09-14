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
      border: const OutlineInputBorder(),
      hintText: hintText,
    ),
  );
}

Widget button1(String buttonName, String buttonType, Function()? func,
    Icon icon, String text) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      minimumSize: const Size.fromHeight(50),
    ),
    onPressed: func,
    child: Text(
      text,
      style: const TextStyle(fontSize: 24),
    ),
  );
}

Widget button(String buttonName, String buttonType, Function()? func,
    var _isLoading, var _onSubmit, String text) {
  return ElevatedButton.icon(
    onPressed: _isLoading ? null : _onSubmit,
    style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.all(16.0)),
    icon: _isLoading
        ? Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(2.0),
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          )
        : const Icon(Icons.feedback),
    label: Text(text),
  );
}
