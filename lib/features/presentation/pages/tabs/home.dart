import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/home/event_home.dart';
import 'package:e_commerce/features/presentation/manager/home/home_bloc.dart';
import 'package:e_commerce/features/presentation/manager/home/state_cat.dart';
import 'package:e_commerce/features/presentation/widget/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => getIt<HomeBloc>()..add(OnLoadHomeData()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Search(),
                SizedBox(
                  height: 16.h,
                ),

                //  ImageSlideshow(
                //     height: 200.h,
                //     width: 398.w,
                //     isLoop: true,
                //     indicatorColor: AppColors.primary,
                //     indicatorBackgroundColor: Colors.white,
                //     children: HomeCubit.get(context).sliders.map((i) {
                //       return Image.asset(i);
                //     }).toList()),
                SizedBox(
                  height: 24.h,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 16.h, right: 17.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: poppins18W500(),
                      ),
                      Text(
                        "view all",
                        style: poppins12W400(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    height: 280.h,
                    child: state.requestState == RequestState.loading
                        ? const Center(child: CircularProgressIndicator())
                        : state.requestState == RequestState.error
                            ? Center(
                                child: Text("Error"),
                              )
                            : state.requestState == RequestState.success
                                ? GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemCount:
                                        state.categoryModel!.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Routes.products);
                                            },
                                            child: SizedBox(
                                              width: 100.w,
                                              height: 100.h,
                                              child: CircleAvatar(
                                                  radius: 50.0,
                                                  backgroundImage: NetworkImage(
                                                      state
                                                              .categoryModel!
                                                              .data?[index]
                                                              .image ??
                                                          '')),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Text(
                                            state.categoryModel!.data?[index]
                                                    .name ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            style: poppins14W400(),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : SizedBox()),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.infinity,
                  child: Text(
                    "Brands",
                    textAlign: TextAlign.start,
                    // style: poppins18W500(),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    height: 280.h,
                    child: state.requestState == RequestState.loading
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    width: 100.w,
                                    height: 100.h,
                                    child: CircleAvatar(
                                        radius: 50.0,
                                        backgroundImage: NetworkImage(state
                                                .brandModelEn
                                                ?.data?[index]
                                                .image ??
                                            "")),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    state.brandModelEn?.data?[index].name ?? "",
                                    style: poppins14W400(),
                                  ),
                                ],
                              );
                            },
                          )),
              ],
            ),
          );
        },
      ),
    );
  }
}
