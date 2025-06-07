import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCardItem extends StatelessWidget {
  var state;
  final int i;
  final String image;
  final String title;
  final String price;
  final void Function()? onIconTop;
  final IconData? iconTop;
  var bloc;
  final Widget widget;
  CustomCardItem(
      {super.key,
      required this.image,
      required this.state,
      required this.i,
      required this.bloc,
      required this.widget,
      required this.iconTop,
      required this.onIconTop,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary)),
      child: Row(
        spacing: 16.w,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 0.5,
                    color: AppColors.primary,
                  )),
              width: 130.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      title,
                      style: poppins18W500(),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "EGP $price",
                    style: poppins18W500(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: onIconTop, child: Icon(iconTop)),
                  widget
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
