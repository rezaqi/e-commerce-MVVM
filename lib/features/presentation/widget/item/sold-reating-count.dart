import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/item/bloc.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:e_commerce/features/presentation/widget/item/cutom_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoldRatingCount extends StatelessWidget {
  final StateItem state;
  final BlocItem bloc;
  const SoldRatingCount({super.key, required this.state, required this.bloc});

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
            "${state.model?.data?.sold} sold",
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
              " ${state.model?.data?.ratingsAverage} (${state.model?.data?.ratingsQuantity})",
              style: poppins18W500(),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        CustomCount(
            add: () {
              bloc.changeCount(true);
            },
            min: () {
              bloc.changeCount(false);
            },
            count: "${state.count}",
            state: state,
            bloc: bloc,
            h: 48.h,
            w: 144.w)
      ],
    );
  }
}
