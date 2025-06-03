import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/categories/bloc_subcat.dart';
import 'package:e_commerce/features/presentation/manager/categories/state_subcat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesSide extends StatelessWidget {
  final StateSubCat state;
  const CategoriesSide({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<SubCatBloc>(context);

    return Container(
      width: 150.w,
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.primary),
            left: BorderSide(color: AppColors.primary),
            bottom: BorderSide(color: AppColors.primary),
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...List.generate(
              state.model?.data?.length ?? 0,
              (i) => Expanded(
                    child: InkWell(
                      onTap: () {
                        bloc.changeCat(i);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (bloc.index == i)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1),
                              width: 5.w,
                              decoration: BoxDecoration(
                                  color: AppColors.text,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          Container(
                            width: 140.w,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: bloc.index == i
                                  ? Colors.white
                                  : AppColors.type,
                            ),
                            child: Text(
                                textAlign: TextAlign.start,
                                style: poppins18W500(),
                                state.model?.data?[i].name ?? ""),
                          ),
                        ],
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
