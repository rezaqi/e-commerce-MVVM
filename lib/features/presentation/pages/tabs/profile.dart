import 'package:e_commerce/core/class/cache/cache_helper.dart';
import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/account/bloc_account.dart';
import 'package:e_commerce/features/presentation/manager/account/event_account.dart';
import 'package:e_commerce/features/presentation/manager/account/state_acount.dart';
import 'package:e_commerce/features/presentation/widget/account/custom_edit.dart';
import 'package:e_commerce/features/presentation/widget/states/error.dart';
import 'package:e_commerce/features/presentation/widget/states/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocAccount>(
      create: (_) => getIt<BlocAccount>()..add(OnEventGetAccount()),
      child: BlocConsumer<BlocAccount, StateAccount>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.requestStateGet == RequestState.loading) {
            return CustomLoading();
          } else if (state.requestStateGet == RequestState.error) {
            return CustomError();
          } else if (state.requestStateGet == RequestState.success) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome ${CacheHelper.prefs.getString("name")}",
                    style: poppins20W600(),
                  ),
                  Text(
                    "${CacheHelper.prefs.getString("email")}",
                    style: poppins14W400(),
                  ),
                  Text(
                    "Your full name",
                    style: poppins18W500(),
                  ),
                  CustomEdit(title: '${CacheHelper.prefs.getString("name")}'),
                  Text(
                    "Your E-mail",
                    style: poppins18W500(),
                  ),
                  CustomEdit(title: '${CacheHelper.prefs.getString("email")}'),
                  Text(
                    "Your Password",
                    style: poppins18W500(),
                  ),
                  CustomEdit(title: '${CacheHelper.prefs.getString("email")}'),
                  Text(
                    "Your phone number",
                    style: poppins18W500(),
                  ),
                  CustomEdit(title: '${state.model!.data![0].phone}'),
                  Text(
                    "Your Address",
                    style: poppins18W500(),
                  ),
                  CustomEdit(title: '${state.model!.data![0].name}')
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
