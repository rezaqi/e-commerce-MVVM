import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:flutter/material.dart';

class CustomCount extends StatelessWidget {
  var state;
  void Function()? min;
  void Function()? add;
  var bloc;
  final double h;
  final double w;
  final String count;
  CustomCount(
      {super.key,
      this.min,
      this.add,
      required this.state,
      required this.bloc,
      required this.h,
      required this.w,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.primary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: min,
            child: Icon(
              Icons.do_not_disturb_on_total_silence_sharp,
              color: AppColors.secondary,
            ),
          ),
          Text(
            count,
            style: poppins18W500().copyWith(color: AppColors.secondary),
          ),
          InkWell(
              onTap: add,
              child: Icon(
                Icons.add_circle_outline_sharp,
                color: AppColors.secondary,
              ))
        ],
      ),
    );
  }
}
