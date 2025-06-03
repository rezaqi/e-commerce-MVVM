import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:flutter/material.dart';

class CustomSize extends StatelessWidget {
  final String count;
  final Color? color;
  const CustomSize({super.key, required this.count, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1)),
      child: Text(
        count,
        style: poppins14W400().copyWith(color: color),
      ),
    );
  }
}
