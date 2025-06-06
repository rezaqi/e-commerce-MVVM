import 'package:flutter/material.dart';

class CustomColor extends StatelessWidget {
  final Color color;
  final isSelected;
  const CustomColor({super.key, required this.color, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: isSelected ? Icon(Icons.check) : SizedBox(),
    );
  }
}
