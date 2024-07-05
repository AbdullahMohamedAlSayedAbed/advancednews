import 'package:flutter/material.dart';

class textFormFieldWidget extends StatelessWidget {
  const textFormFieldWidget({
    super.key,
    this.validator,
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onPressed,
    this.onChanged,
  });
  final String? Function(String?)? validator;
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final void Function() onPressed;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.deepOrange),
      cursorColor: Colors.deepOrange ,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(
              prefixIcon,
              color: Colors.deepOrange,
            )),
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.deepOrange,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.deepOrange),
        border: defaultOutlineInput(),
        focusedBorder: defaultOutlineInput(),
        enabledBorder: defaultOutlineInput(),
      ),
    );
  }

  OutlineInputBorder defaultOutlineInput() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.deepOrange));
  }
}
