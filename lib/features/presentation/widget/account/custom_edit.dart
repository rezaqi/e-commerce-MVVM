import 'package:flutter/material.dart';

class CustomEdit extends StatelessWidget {
  final String title;
  const CustomEdit({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Icon(Icons.mode_edit_outline_outlined)],
        ));
  }
}
