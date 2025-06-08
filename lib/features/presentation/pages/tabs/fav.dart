import 'package:e_commerce/core/class/api/lineks.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/fav/bloc_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/event_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/state_fav.dart';
import 'package:e_commerce/features/presentation/manager/item/bloc.dart';
import 'package:e_commerce/features/presentation/manager/item/event.dart';
import 'package:e_commerce/features/presentation/widget/cart/custom_cart.dart';
import 'package:e_commerce/features/presentation/widget/states/error.dart';
import 'package:e_commerce/features/presentation/widget/states/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider<BlocFav>(
          create: (context) => getIt<BlocFav>()..add(OnEventGetFav()),
        ),
        BlocProvider<BlocItem>(create: (context) => getIt<BlocItem>()),
      ],
      child: BlocConsumer<BlocFav, StateFav>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.requestStateGet == RequestState.loading) {
              return CustomLoading();
            }
            if (state.requestStateGet == RequestState.error) {
              return CustomError();
            }

            if (state.requestStateGet == RequestState.success) {
              var bloc = BlocFav.get(context);
              var blocCart = BlocItem.get(context);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                        state.model!.data!.length,
                        (i) => CustomCardItem(
                              widgetImage: PageView.builder(
                                itemBuilder: (context, index) => Image.network(
                                  "${AppLinks.productImage}/${state.model!.data![i].images![index]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              price: "${state.model!.data![i].price}",
                              title: "${state.model!.data![i].title}",
                              state: state,
                              i: i,
                              bloc: bloc,
                              widget: InkWell(
                                onTap: () {
                                  blocCart.add(OnItemAdd(
                                      productId: state.model!.data![i].id!));
                                  Fluttertoast.showToast(
                                      msg: "item added to cart ",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: AppColors.primary,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Add to cart",
                                    style: poppins14W400()
                                        .copyWith(color: AppColors.secondary),
                                  ),
                                ),
                              ),
                              iconTop: Icons.favorite_rounded,
                              onIconTop: () {
                                bloc.add(OnEventRemoveFav(
                                    itemId: "${state.model!.data![i].sId}"));
                                Fluttertoast.showToast(
                                    msg: "item removed from your favorites",
                                    toastLength: Toast.LENGTH_SHORT,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: AppColors.primary,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              },
                            ))
                  ],
                ),
              );
            }

            return SizedBox();
          }),
    ));
  }
}
