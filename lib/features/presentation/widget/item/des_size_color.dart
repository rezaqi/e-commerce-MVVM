import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:e_commerce/features/presentation/widget/item/custom_color.dart';
import 'package:e_commerce/features/presentation/widget/item/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesSizeColor extends StatelessWidget {
  final StateItem state;
  const DesSizeColor({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 1.w,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 10.h,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: poppins20W600(),
            ),
            Text("${state.model?.data?.description}"),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Size",
              style: poppins20W600(),
            ),
            Row(
              children: [
                ...List.generate(5, (index) {
                  return CustomSize(color: Colors.black, count: "38");
                })
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Color",
              style: poppins20W600(),
            ),
            Row(
              children: [
                CustomColor(
                  color: Colors.red,
                ),
                CustomColor(
                  color: Colors.blueAccent,
                ),
                CustomColor(
                  color: Colors.amberAccent,
                ),
                CustomColor(
                  color: Colors.lightBlue,
                ),
                CustomColor(
                  color: Colors.purpleAccent,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
