import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  late String title;
  late bool isChacked = false;

  CheckBox({super.key, required this.title, required this.isChacked});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          Checkbox(
              onChanged: (bool? value) {
                setState(() {
                  widget.isChacked = !widget.isChacked;
                });
              },
              value: widget.isChacked),
          Text('${widget.title}')
        ],
      ),
    );
  }
}
