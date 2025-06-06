import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/fav/bloc_fav.dart';
import 'package:e_commerce/features/presentation/manager/products/bloc.dart';
import 'package:e_commerce/features/presentation/manager/products/event.dart';
import 'package:e_commerce/features/presentation/manager/products/state.dart';
import 'package:e_commerce/features/presentation/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Products extends StatelessWidget {
  final String id;
  const Products({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BlocProducts>(
          create: (_) => getIt<BlocProducts>()..add(OnProducts(id: id)),
        ),
        BlocProvider<BlocFav>(
          create: (_) => getIt<BlocFav>(),
        )
      ],
      child: BlocConsumer<BlocProducts, StateProducts>(
          listener: (_, state) {},
          builder: (context, state) {
            var blocFav = BlocFav.get(context);
            return state.requestState == RequestState.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : state.requestState == RequestState.error
                    ? Center(
                        child: Text("Error"),
                      )
                    : state.requestState == RequestState.success
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        //     childAspectRatio: 191.w,
                                        mainAxisExtent: 290.h,
                                        crossAxisSpacing: 16.w,
                                        mainAxisSpacing: 16.h),
                                itemCount: 10,
                                itemBuilder: (context, index) => ProductItem(
                                    blocFav: blocFav,
                                    state.model!.data![index])),
                          )
                        : SizedBox();
          }),
    );
  }
}
