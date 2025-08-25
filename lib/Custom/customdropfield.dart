import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownWithAddOption extends StatefulWidget {
  final String label;
  final bool isRequired;
  final List<String> options;
  final String? value;
  final Function(String?) onChanged;

  const DropdownWithAddOption({
    Key? key,
    required this.label,
    this.isRequired = false,
    required this.options,
    this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DropdownWithAddOption> createState() => _DropdownWithAddOptionState();
}

class _DropdownWithAddOptionState extends State<DropdownWithAddOption> {
  late List<String> _items;
  final TextEditingController _newOptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.options);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      value: widget.value != null && _items.contains(widget.value)
          ? widget.value
          : null, // ensure only valid values
      isExpanded: true,
      decoration: InputDecoration(
        labelText: widget.isRequired ? "${widget.label} *" : widget.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      items: _items
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: widget.onChanged,
      validator: (val) {
        if (widget.isRequired && (val == null || val.isEmpty)) {
          return "${widget.label} is required";
        }
        return null;
      },

      /// 👇 This is where we add custom textfield at top
      dropdownSearchData: DropdownSearchData(
        searchInnerWidgetHeight: 60,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _newOptionController,
                  decoration: InputDecoration(
                    hintText: "Add new ${widget.label}",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.blue),
                onPressed: () {
                  final newVal = _newOptionController.text.trim();
                  if (newVal.isNotEmpty && !_items.contains(newVal)) {
                    setState(() {
                      _items.insert(0, newVal);
                      _newOptionController.clear();
                    });
                    widget.onChanged(newVal);
                    
                    Navigator.pop(context); // close dropdown
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}







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