import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_bloc.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_event.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_state.dart';
import 'package:e_commerce/features/presentation/widget/item/cutom_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCart extends StatelessWidget {
  final StateCart state;
  final int i;
  final BlocCart bloc;
  const CustomCart(
      {super.key, required this.state, required this.i, required this.bloc});

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
                  "${state.model!.data!.products![i].product!.imageCover}",
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
                      "${state.model!.data!.products![i].product!.title}",
                      style: poppins18W500(),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "EGP ${state.model!.data!.products![i].price}",
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
                  InkWell(
                      onTap: () {
                        bloc.add(OnEventDeleteCart(
                          cartId:
                              "${state.model!.data!.products![i].product!.id}",
                        ));
                      },
                      child: Icon(Icons.delete_outline_rounded)),
                  CustomCount(
                    min: () {
                      int count = state.model!.data!.products![i].count! - 1;
                      bloc.add(OnEventUpdateCart(
                          cartId:
                              "${state.model!.data!.products![i].product!.id}",
                          count: "$count"));
                    },
                    add: () {
                      int count = state.model!.data!.products![i].count! + 1;
                      bloc.add(OnEventUpdateCart(
                          cartId:
                              "${state.model!.data!.products![i].product!.id}",
                          count: "$count"));
                    },
                    count: "${state.model!.data!.products![i].count}",
                    h: 40.h,
                    w: double.infinity,
                    bloc: bloc,
                    state: state,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
