import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:e_commerce/features/presentation/widget/item/custom_color.dart';
import 'package:e_commerce/features/presentation/widget/item/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DesSizeColor extends StatefulWidget {
  final StateItem state;
  const DesSizeColor({super.key, required this.state});

  @override
  State<DesSizeColor> createState() => _DesSizeColorState();
}

int iSize = 37;
int selectedSize = -1;
int selectedColor = -1;
List<Color> color = [
  Colors.brown,
  Colors.cyanAccent,
  Colors.indigo,
  Colors.lime
];

class _DesSizeColorState extends State<DesSizeColor> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            Text("${widget.state.model?.data?.description}"),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Size",
              style: poppins20W600(),
            ),
            Row(
              spacing: 10.w,
              children: [
                ...List.generate(5, (index) {
                  return InkWell(
                    onTap: () {
                      selectedSize = index;
                      setState(() {});
                    },
                    child: CustomSize(
                        bgColor: selectedSize == index
                            ? AppColors.primary
                            : Colors.transparent,
                        color: selectedSize == index
                            ? AppColors.secondary
                            : Colors.black,
                        count: "$iSize"),
                  );
                })
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
              spacing: 10.w,
              children: [
                ...List.generate(4, (index) {
                  return InkWell(
                    onTap: () {
                      selectedColor = index;
                      setState(() {});
                    },
                    child: CustomColor(
                      isSelected: selectedColor == index,
                      color: color[index],
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
