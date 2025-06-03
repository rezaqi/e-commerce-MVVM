import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoldRatingCount extends StatefulWidget {
  final StateItem state;
  const SoldRatingCount({super.key, required this.state});

  @override
  State<SoldRatingCount> createState() => _SoldRatingCountState();
}

class _SoldRatingCountState extends State<SoldRatingCount> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            "${widget.state.model?.data?.sold} sold",
            style: poppins18W500(),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.star_purple500_sharp,
              color: Colors.yellow,
            ),
            Text(
              " ${widget.state.model?.data?.ratingsAverage} (${widget.state.model?.data?.ratingsQuantity})",
              style: poppins18W500(),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Container(
          height: 47.h,
          width: 144.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  if (count > 0) {
                    --count;
                    setState(() {});
                  }
                },
                child: Icon(
                  Icons.do_not_disturb_on_total_silence_sharp,
                  color: AppColors.secondary,
                ),
              ),
              Text(
                "$count",
                style: poppins18W500().copyWith(color: AppColors.secondary),
              ),
              InkWell(
                  onTap: () {
                    count++;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.add_circle_outline_sharp,
                    color: AppColors.secondary,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
