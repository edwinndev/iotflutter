import 'package:flutter/material.dart';

class InputText extends TextFormField {
  InputText({
    super.key,
    TextInputType? type,
    required TextEditingController controller,
    required String label,
  }) : super (
    controller: controller,
    keyboardType: type ?? TextInputType.text,
    style: const TextStyle(
      fontSize: 16.0,
      color: Colors.black
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      labelText: label,
    )
  );
}

class InputDropdown<T> extends DropdownButtonFormField<T> {
  InputDropdown({
    super.key,
    required List<DropdownMenuItem<T>> items,
    required String label,
    required void Function(T? s) onChanged
  }) : super (
    onChanged: onChanged,
    items: items,
    iconSize: 25.0,
    borderRadius: BorderRadius.circular(5.0),
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      labelText: label
    ),
  );
}