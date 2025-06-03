import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/item/bloc.dart';
import 'package:e_commerce/features/presentation/manager/item/event.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:e_commerce/features/presentation/widget/item/custom_color.dart';
import 'package:e_commerce/features/presentation/widget/item/custom_size.dart';
import 'package:e_commerce/features/presentation/widget/item/image.dart';
import 'package:e_commerce/features/presentation/widget/item/sold-reating-count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item extends StatefulWidget {
  final String? id;
  const Item({
    super.key,
    this.id,
  });

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<BlocItem>(
        create: (_) => getIt<BlocItem>()..add(OnItem(id: widget.id ?? "")),
        child: BlocConsumer<BlocItem, StateItem>(
          listener: (_, state) {},
          builder: (_, state) {
            if (state.requestState == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.requestState == RequestState.error) {
              return const Center(child: Text("Error"));
            } else if (state.requestState == RequestState.success) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  spacing: 15.h,
                  children: [
                    ImageStackItem(
                      state: state,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${state.model?.data?.title}",
                          style: poppins18W500(),
                        ),
                        Text(
                          "EGP ${state.model?.data?.price}",
                          style: poppins18W500(),
                        ),
                      ],
                    ),
                    SoldRatingCount(state: state),
                    Positioned(
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
                                CustomSize(count: "38"),
                                CustomSize(count: "39"),
                                CustomSize(count: "40"),
                                CustomSize(count: "41"),
                                CustomSize(count: "42"),
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
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total price",
                              style: poppins12W400().copyWith(fontSize: 18),
                            ),
                            Text("EGP ${state.model?.data?.price}",
                                style: poppins20W600()),
                          ],
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: Container(
                            width: 48.w,
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.primary,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.add_business,
                                  color: AppColors.secondary,
                                ),
                                Text(
                                  "Add to cart",
                                  style: poppins20W600()
                                      .copyWith(color: AppColors.secondary),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
