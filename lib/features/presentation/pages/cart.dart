import 'package:e_commerce/core/class/appbar/appbar.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_bloc.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_event.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_state.dart';
import 'package:e_commerce/features/presentation/widget/cart/cart_widget.dart';
import 'package:e_commerce/features/presentation/widget/states/error.dart';
import 'package:e_commerce/features/presentation/widget/states/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            appBar(context: context, title: "Cart", isBack: true, isCar: true),
        body: BlocProvider<BlocCart>(
          create: (context) => getIt<BlocCart>()..add(OnEventCart()),
          child: BlocConsumer<BlocCart, StateCart>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.requestState == RequestState.loading) {
                  return CustomLoading();
                }
                if (state.requestState == RequestState.error) {
                  return CustomError();
                }

                if (state.requestState == RequestState.success) {
                  var bloc = BlocCart.get(context);
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(
                        height: double.infinity,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                state.model!.data!.products!.length,
                                (i) =>
                                    CartWidget(state: state, i: i, bloc: bloc))
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10.h,
                        right: 10.w,
                        left: 10.w,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: 100.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              216, 0, 0, 0),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "Total Price\n EGP ${state.model!.data!.totalCartPrice}",
                                        style: poppins18W500().copyWith(
                                            color: AppColors.secondary),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 60.h,
                                  width: 250.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Check Out",
                                        style: poppins18W500().copyWith(
                                          color: AppColors.secondary,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: AppColors.secondary,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return SizedBox();
              }),
        ));
  }
}
