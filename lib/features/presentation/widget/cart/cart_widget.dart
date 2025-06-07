import 'package:e_commerce/features/presentation/manager/cart/cart_bloc.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_event.dart';
import 'package:e_commerce/features/presentation/manager/cart/cart_state.dart';
import 'package:e_commerce/features/presentation/widget/cart/custom_cart.dart';
import 'package:e_commerce/features/presentation/widget/item/cutom_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartWidget extends StatelessWidget {
  final StateCart state;
  final int i;

  final BlocCart bloc;

  const CartWidget({
    super.key,
    required this.state,
    required this.i,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCardItem(
      title: "${state.model!.data!.products![i].product!.title}",
      price: " ${state.model!.data!.products![i].price}",
      image: "${state.model!.data!.products![i].product!.imageCover}",
      onIconTop: () {
        bloc.add(OnEventDeleteCart(
          cartId: "${state.model!.data!.products![i].product!.id}",
        ));
      },
      iconTop: Icons.delete_outline_rounded,
      bloc: bloc,
      state: state,
      i: i,
      widget: CustomCount(
        min: () {
          int count = state.model!.data!.products![i].count! - 1;
          bloc.add(OnEventUpdateCart(
              cartId: "${state.model!.data!.products![i].product!.id}",
              count: "$count"));
        },
        add: () {
          int count = state.model!.data!.products![i].count! + 1;
          bloc.add(OnEventUpdateCart(
              cartId: "${state.model!.data!.products![i].product!.id}",
              count: "$count"));
        },
        count: "${state.model!.data!.products![i].count}",
        h: 40.h,
        w: double.infinity,
        bloc: bloc,
        state: state,
      ),
    );
  }
}
