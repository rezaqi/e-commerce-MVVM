import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/features/presentation/manager/tabs/state_tab.dart';
import 'package:e_commerce/features/presentation/manager/tabs/tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabWidget extends StatelessWidget {
  final TabBloc bloc;
  final int index;
  final IconData icon;
  const CustomTabWidget(
      {Key? key, required this.bloc, required this.index, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, TabsState>(
      bloc: bloc,
      builder: (context, state) {
        bool isSelected = state.indexScreen == index;
        return Container(
          padding: isSelected
              ? EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h)
              : EdgeInsets.zero,
          decoration: isSelected
              ? BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20))
              : BoxDecoration(),
          child: Icon(
            icon,
            color: isSelected ? AppColors.secondary : AppColors.primary,
          ),
        );
      },
    );
  }
}
