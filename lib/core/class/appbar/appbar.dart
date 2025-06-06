import 'package:e_commerce/config/routs/routs.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:flutter/material.dart';

AppBar appBar(
    {required BuildContext context,
    bool isBack = false,
    String title = "",
    bool isCar = false}) {
  return AppBar(
    leading: isBack
        ? InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_outlined))
        : SizedBox(),
    actions: [
      isCar
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                alignment: Alignment.topCenter,
                label: Text(""
                    // HomeCubit.get(context).numOfItemsInCart.toString()
                    ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.cart);
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: AppColors.primary,
                    )),
              ),
            )
    ],
    title: Text(
      title,
      style: poppins20W600(),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}
