import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCatGroup extends StatelessWidget {
  final String count;
  final String title;
  const CustomCatGroup({super.key, required this.count, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 192.h,
      width: 165.w,
      child: Column(
        children: [
          SizedBox(
            height: 160.h,
            width: 150.w,
            child: GridView.builder(
              itemCount: 4, // عدد العناصر
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // قلل العدد ليتناسب مع العرض
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text('Item $index')),
              ),
              physics:
                  NeverScrollableScrollPhysics(), // لمنع التمرير داخل GridView
              shrinkWrap: true, // لتحديد الارتفاع تلقائيًا إذا أردت
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: poppins20W600(),
              ),
              Container(
                decoration: BoxDecoration(color: AppColors.type),
                child: Text(count),
              )
            ],
          )
        ],
      ),
    );
  }
}
