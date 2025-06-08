import 'package:e_commerce/core/class/appbar/appbar.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/fav/bloc_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/event_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/state_fav.dart';
import 'package:e_commerce/features/presentation/manager/item/bloc.dart';
import 'package:e_commerce/features/presentation/manager/item/event.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:e_commerce/features/presentation/widget/item/des_size_color.dart';
import 'package:e_commerce/features/presentation/widget/item/image.dart';
import 'package:e_commerce/features/presentation/widget/item/sold-reating-count.dart';
import 'package:e_commerce/features/presentation/widget/states/error.dart';
import 'package:e_commerce/features/presentation/widget/states/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      appBar:
          appBar(context: context, isBack: true, isCar: true, title: "Product"),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<BlocItem>(
            create: (blocContext) =>
                getIt<BlocItem>()..add(OnItem(id: widget.id ?? "")),
          ),
          BlocProvider<BlocFav>(
              create: (_) => getIt<BlocFav>()..add(OnEventGetFav()))
        ],
        child: BlocListener<BlocFav, StateFav>(
          listener: (context, state) {
            if (BlocFav.get(context).state.isAdd == true ||
                BlocFav.get(context).state.requestStateGet ==
                    RequestState.success) {
              BlocItem.get(context).doneFav();
            }
          },
          child: BlocConsumer<BlocItem, StateItem>(
            listener: (blocContext, state) {},
            builder: (blocContext, state) {
              if (state.requestState == RequestState.loading ||
                  state.requestStateCart == RequestState.loading) {
                return CustomLoading();
              } else if (state.requestState == RequestState.error) {
                return CustomError();
              } else if (state.requestState == RequestState.success) {
                var bloc = BlocItem.get(blocContext);
                var blocFav = BlocFav.get(blocContext);

                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      spacing: 15.h,
                      children: [
                        ImageStackItem(
                          onFav: () async {
                            if (blocFav.listFav
                                .contains(state.model!.data!.id)) {
                              blocFav.add(OnEventRemoveFav(
                                  itemId: "${state.model!.data!.id}"));
                              Fluttertoast.showToast(
                                  msg: "item removed from your favorites",
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: AppColors.primary,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              blocFav.add(OnEventAddFav(
                                  itemId: "${state.model!.data!.id}"));
                              Fluttertoast.showToast(
                                  msg: "item added to your favorites",
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: AppColors.primary,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          },
                          bloc: blocFav,
                          state: state,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 280.w,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                "${state.model?.data?.title}",
                                style: poppins18W500(),
                              ),
                            ),
                            Text(
                              "EGP ${state.model?.data?.price}",
                              style: poppins18W500(),
                            ),
                          ],
                        ),
                        SoldRatingCount(state: state, bloc: bloc),
                        DesSizeColor(state: state),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Total price",
                                  style: poppins12W400().copyWith(fontSize: 18),
                                ),
                                Text(
                                    "EGP ${bloc.totalPrice(state.model?.data?.price ?? 0)}",
                                    style: poppins20W600()),
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  for (int i = 0; i < state.count; i++) {
                                    bloc.add(OnItemAdd(
                                        productId: state.model!.data!.id!));
                                  }
                                  Fluttertoast.showToast(
                                      msg: "item added to cart ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColors.primary,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Container(
                                  width: 48.w,
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColors.primary,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.add_business,
                                        color: AppColors.secondary,
                                      ),
                                      Text(
                                        "Add to cart",
                                        style: poppins20W600().copyWith(
                                            color: AppColors.secondary),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
