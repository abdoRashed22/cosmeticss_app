import 'package:flutter/material.dart';

class AppDropDown extends StatefulWidget {
  //final TextEditingController controller;

  const AppDropDown({super.key});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  String selectedCode = "+20";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 85,
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedCode,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: const [
                DropdownMenuItem(value: "+20", child: Text("+20")),
                DropdownMenuItem(value: "+966", child: Text("+966")),
                DropdownMenuItem(value: "+971", child: Text("+971")),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    selectedCode = val;
                  });
                }
              },
            ),
          ),
        ),

        const SizedBox(width: 8),
      ],
    );
  }
}
