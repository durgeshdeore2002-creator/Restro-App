import 'package:flutter/material.dart';

/// 3️⃣ Dropdown TextField
class DropdownTextField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final List<String> options;
  final String? value;
  final Function(String?) onChanged;

  const DropdownTextField({
    Key? key,
    required this.label,
    this.isRequired = false,
    required this.options,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: isRequired ? "$label *" : label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      items: options
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: onChanged,
      validator: (val) {
        if (isRequired && (val == null || val.isEmpty)) {
          return "$label is required";
        }
        return null;
      },
    );
  }
}