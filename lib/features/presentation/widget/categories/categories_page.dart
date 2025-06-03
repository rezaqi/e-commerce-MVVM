import 'package:e_commerce/core/class/states/request_state.dart';
import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/di.dart';
import 'package:e_commerce/features/presentation/manager/categories/bloc_subcat.dart';
import 'package:e_commerce/features/presentation/manager/categories/event_subcat.dart';
import 'package:e_commerce/features/presentation/manager/categories/state_subcat.dart';
import 'package:e_commerce/features/presentation/widget/categories/categories_side.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesPage extends StatefulWidget {
  final Function(String) ontap;
  const CategoriesPage({super.key, required this.ontap});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late final SubCatBloc subCatBloc;

  @override
  void initState() {
    super.initState();
    subCatBloc = getIt<SubCatBloc>();
    subCatBloc.add(OnSubCat());
    subCatBloc.add(
        OnItems(id: "${subCatBloc.state.model?.data?[subCatBloc.index].sId}"));
  }

  @override
  void dispose() {
    subCatBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String id = "";
    return BlocProvider.value(
      value: subCatBloc,
      child: BlocConsumer<SubCatBloc, StateSubCat>(
          listener: (context, state) {},
          builder: (context, state) {
            var bloc = BlocProvider.of<SubCatBloc>(context);

            return state.requestState == RequestState.loading
                ? const Center(child: CircularProgressIndicator())
                : state.requestState == RequestState.error
                    ? Center(
                        child: Text("Error"),
                      )
                    : state.requestState == RequestState.success
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoriesSide(
                                  state: state,
                                ),
                                state.subRequestState == RequestState.success
                                    ? SizedBox(
                                        width: 200.w,
                                        child: Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "${state.model?.data?[bloc.index].name}" ??
                                                    "",
                                                style: poppins20W600(),
                                              ),
                                              Flexible(
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                        2, // عدد الأعمدة
                                                    crossAxisSpacing:
                                                        10, // المسافة الأفقية بين العناصر
                                                    mainAxisSpacing:
                                                        10, // المسافة الرأسية بين العناصر
                                                    childAspectRatio: 3 /
                                                        4, // نسبة العرض إلى الارتفاع للعنصر
                                                  ),
                                                  itemCount: state.modelItem
                                                      ?.results, // عدد العناصر
                                                  itemBuilder:
                                                      (context, index) =>
                                                          InkWell(
                                                    onTap: () {
                                                      String selectedId =
                                                          "${bloc.state.modelItem?.data?[index].category}";
                                                      widget.ontap(selectedId);
                                                      // لا تستخدم Navigator.pop لأنك لا تريد الرجوع
                                                    },
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                AppColors.type,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Text(
                                                            textAlign: TextAlign
                                                                .center,
                                                            "${state.modelItem?.data?[index].name}",
                                                            style:
                                                                poppins14W400())),
                                                  ),
                                                  padding: const EdgeInsets.all(
                                                      16), // مسافة خارجية حول الشبكة
                                                  shrinkWrap:
                                                      true, // مفيد داخل scrollable مثل Column
                                                  physics:
                                                      const BouncingScrollPhysics(), // تأثير التمرير
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          )
                        : const SizedBox.shrink();
          }),
    );
  }
}
