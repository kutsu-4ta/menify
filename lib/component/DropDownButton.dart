import 'package:flutter/material.dart';

class DropdownButtonMenu extends StatefulWidget {
  final List<String> list;
  const DropdownButtonMenu({Key? key, required this.list}) : super(key: key);

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}


class _DropdownButtonMenuState extends State<DropdownButtonMenu> {

  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.black54,
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
                color: Colors.white
            ),
          ),
        );
      }).toList(),
      value: widget.list.first,
      onChanged: (String? value) {
        setState(() {
          selectedValue = value!;
        });
      },
    );
  }
}