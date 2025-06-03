import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle poppins20W600() => GoogleFonts.poppins(
    fontSize: 20.sp, fontWeight: FontWeight.w600, color: AppColors.text);

TextStyle poppins14W300({Color color = AppColors.primary}) =>
    GoogleFonts.poppins(
        fontSize: 14.sp, fontWeight: FontWeight.w300, color: color);

TextStyle poppins14W400() => GoogleFonts.poppins(
    fontSize: 14.sp, fontWeight: FontWeight.w400, color: AppColors.text);

TextStyle poppins12W400() => GoogleFonts.poppins(
    fontSize: 12.sp, fontWeight: FontWeight.w400, color: AppColors.text);

TextStyle poppins18W500() => GoogleFonts.poppins(
    fontSize: 18.sp, fontWeight: FontWeight.w500, color: AppColors.text);

TextStyle text20W600() => GoogleFonts.poppins(
    fontSize: 25.sp, fontWeight: FontWeight.w600, color: AppColors.text);
