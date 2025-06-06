import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/images/app_images.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/search/bloc_search.dart';
import 'package:e_commerce/features/presentation/manager/search/state_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocSearch, StateSearch>(
        listener: (context, state) {},
        builder: (context, state) {
          var bloc = context.read<BlocSearch>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 348.w,
                  height: 50.h,
                  child: TextFormField(
                    controller: bloc.searchController,
                    decoration: InputDecoration(
                      prefixIcon: Container(
                          margin: EdgeInsets.only(
                              left: 24.07.w,
                              top: 13.h,
                              bottom: 13.h,
                              right: 7.93.w),
                          child: Image.asset(
                            AppImages.search,
                            width: 24.w,
                            height: 24.h,
                          )),
                      hintText: 'what do you search for?',
                      hintStyle: poppins14W300(),
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 20.0),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.cart);
                    },
                    child: Image.asset(
                      AppImages.cart,
                      width: 24.w,
                      height: 24.h,
                    )),
              ],
            ),
          );
        });
  }
}
