import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/features/presentation/manager/fav/bloc_fav.dart';
import 'package:e_commerce/features/presentation/manager/item/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageStackItem extends StatefulWidget {
  final StateItem state;
  final BlocFav bloc;
  final void Function()? onFav;
  const ImageStackItem(
      {super.key, required this.state, required this.bloc, this.onFav});

  @override
  State<ImageStackItem> createState() => _ImageStackItemState();
}

class _ImageStackItemState extends State<ImageStackItem> {
  int currentPage = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != currentPage) {
        setState(() {
          currentPage = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 250.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.state.model?.data?.images?.length ?? 0,
            itemBuilder: (context, index) {
              final item = widget.state.model?.data?.images?[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    "$item",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
            right: 10.w,
            top: 10.h,
            child: InkWell(
                onTap: widget.onFav, child: Icon(Icons.favorite_border))),
        Positioned(
            bottom: 10.h,
            child: Row(
              children: [
                ...List.generate(widget.state.model?.data?.images?.length ?? 0,
                    (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 600),
                    margin: EdgeInsets.only(right: 5.w),
                    height: 7.h,
                    width: currentPage == index ? 30.w : 7.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: AppColors.primary),
                        color: currentPage == index
                            ? AppColors.primary
                            : Colors.transparent),
                  );
                })
              ],
            ))
      ],
    );
    ;
  }
}
