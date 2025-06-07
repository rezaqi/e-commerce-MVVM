import 'package:e_commerce/core/class/appbar/appbar.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/fav/bloc_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/event_fav.dart';
import 'package:e_commerce/features/presentation/manager/fav/state_fav.dart';
import 'package:e_commerce/features/presentation/widget/cart/custom_cart.dart';
import 'package:e_commerce/features/presentation/widget/states/error.dart';
import 'package:e_commerce/features/presentation/widget/states/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context: context, title: "Favorite", isCar: true),
        body: BlocProvider<BlocFav>(
          create: (context) => getIt<BlocFav>()..add(OnEventGetFav()),
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
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                            state.model!.data!.length,
                            (i) => CustomCardItem(
                                price: "${state.model!.data![i].price}",
                                title: "${state.model!.data![i].title}",
                                image: "${state.model!.data![i].images![0]}",
                                state: state,
                                i: i,
                                bloc: bloc,
                                widget: Container(),
                                iconTop: Icons.favorite_border_rounded,
                                onIconTop: () {}))
                      ],
                    ),
                  );
                }

                return SizedBox();
              }),
        ));
  }
}
