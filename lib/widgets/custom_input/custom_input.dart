import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validFn; // ✅ Sửa tại đây
  final String? Function(String?)? onChangefn; // ✅ Sửa tại đây


  const CustomInput({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.validFn, this.onChangefn,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChangefn,
      controller: textEditingController,
      keyboardType: textInputType,
      validator: (value) {
        if (validFn != null) {
          return validFn!(value); // ✅ Gọi an toàn và đúng kiểu
        } else {
          if (value == null || value.isEmpty) {
            return 'Vui lòng nhập $labelText';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}
