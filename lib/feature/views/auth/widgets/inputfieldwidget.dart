import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Mobile Number',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Mobile number is required";
        } else if (value.length != 10) {
          return "mobile number should 10";
        } else {
          return null;
        }
      },
    );
  }
}
