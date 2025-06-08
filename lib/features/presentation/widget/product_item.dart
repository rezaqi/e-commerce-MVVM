import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/features/data/model/products_model.dart';
import 'package:e_commerce/features/presentation/manager/fav/bloc_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/event_fav.dart';
import 'package:e_commerce/features/presentation/manager/item/bloc.dart';
import 'package:e_commerce/features/presentation/manager/item/event.dart';
import 'package:e_commerce/features/presentation/manager/products/bloc.dart';
import 'package:e_commerce/features/presentation/manager/products/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  final BlocFav blocFav;
  BlocProducts? blocProducts;
  StateProducts? stateProducts;
  BlocItem? blocAddToCart;

  //ProductDataEntity

  Data model;

  ProductItem(this.model,
      {required this.blocFav,
      this.blocAddToCart,
      this.stateProducts,
      this.blocProducts,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (model.id != null) {
          Navigator.pushNamed(context, Routes.item, arguments: model.id);
        }
      },
      child: Container(
        height: 237.h,
        width: 191.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
                color: const Color(0xff004182).withOpacity(.3), width: 2.w)),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  child: Image.network(
                    model.imageCover ?? "",
                    height: 128.h,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        model.title ?? "",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: const Color(0xff06004F)),
                      ),
                      SizedBox(
                        height: 6.h,
                        child: Text(
                          model.description ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: const Color(0xff06004F)),
                        ),
                      ),
                      // SizedBox(
                      //   height: 8.h,
                      // ),
                      SizedBox(
                        height: 15.h,
                        child: Row(
                          children: [
                            Text(
                              model.price.toString(),
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                  color: const Color(0xff06004F)),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              (model.price ?? 50 - 50).toString(),
                              style: GoogleFonts.poppins(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                      const Color(0xff004182).withOpacity(.6)
                                  // Replace with your desired color
                                  ,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color:
                                      const Color(0xff004182).withOpacity(.6)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      SizedBox(
                        height: 15.h,
                        child: Row(
                          children: [
                            Text(
                              'Review (${model.ratingsAverage})',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: const Color(0xff06004F)),
                            ),
                            Icon(
                              Icons.star,
                              color: const Color(0xffFDD835),
                              size: 15.h,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () async {
                    blocProducts?.loadingFav();

                    if (blocFav.listFav.contains(model.id)) {
                      blocFav.add(OnEventRemoveFav(itemId: "${model.id}"));

                      Fluttertoast.showToast(
                          msg: "item removed form your favorites",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      blocFav.add(OnEventAddFav(itemId: "${model.id}"));

                      Fluttertoast.showToast(
                          msg: "item added to your favorites",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColors.primary,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: blocFav.listFav.contains(model.id)
                          ? Icon(
                              Icons.favorite_rounded,
                              color: AppColors.primary,
                            )
                          : Icon(Icons.favorite_border),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 8.w),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    blocAddToCart!.add(OnItemAdd(productId: model.id ?? ''));

                    if (blocAddToCart!.state.requestStateCart ==
                        RequestState.success) {
                      Fluttertoast.showToast(
                          msg: "Update cart success",
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColors.primary,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: const Color(0xff004182),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
