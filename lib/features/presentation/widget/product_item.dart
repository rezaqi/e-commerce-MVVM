import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/features/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  //ProductDataEntity
  Data model;

  ProductItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("0000000000000000000000000000000000000000000000000000");
        print(model.id);
        if (model.id != null) {
          // print("""""" """""" """""" """object""" """""" """""" """""");
          // print(model.id);
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
                        height: 10.h,
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
                      SizedBox(
                        height: 8.h,
                      ),
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
                  onTap: () {
                    // fav = !fav;
                    // setState(() {});
                  },
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(Icons.favorite_border),
                      // child: fav
                      //     ? Image.asset('assets/images/Vectorhart_full.png')
                      //     : Image.asset('assets/images/heart.png'),
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
                    //  HomeCubit.get(context).addTCart(model.id ?? "");
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
