import 'package:e_commerce/core/class/uitls/color/app_colors.dart';
import 'package:e_commerce/core/class/uitls/text_styles.dart';
import 'package:e_commerce/features/presentation/manager/search/bloc_search.dart';
import 'package:e_commerce/features/presentation/manager/tabs/state_tab.dart';
import 'package:e_commerce/features/presentation/manager/tabs/tab_bloc.dart';
import 'package:e_commerce/features/presentation/widget/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // LoginEntity loginEntity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabBloc>(
          create: (context) => TabBloc(),
        ),
        BlocProvider<BlocSearch>(create: (_) => BlocSearch())
      ],
      child: BlocBuilder<TabBloc, TabsState>(builder: (context, state) {
        var bloc = TabBloc.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Badge(
                  alignment: Alignment.topCenter,
                  label: Text(""
                      // HomeCubit.get(context).numOfItemsInCart.toString()
                      ),
                  child: IconButton(
                      onPressed: () {
                        //      Navigator.pushNamed(context, Routes.cart);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: AppColors.primary,
                      )),
                ),
              )
            ],
            title: Text(
              "Home",
              style: poppins20W600(),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),

          // body
          body: bloc.tabs[state.indexScreen],
          //bottomNavigationBar
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.indexScreen,
            onTap: (index) => bloc.changeScreen(index),
            items: [
              BottomNavigationBarItem(
                  icon: CustomTabWidget(
                    bloc: bloc,
                    index: 0,
                    icon: Icons.home,
                  ),
                  label: "",
                  backgroundColor: AppColors.secondary),
              BottomNavigationBarItem(
                  icon: CustomTabWidget(
                    bloc: bloc,
                    index: 1,
                    icon: Icons.category_outlined,
                  ),
                  label: "",
                  backgroundColor: AppColors.secondary),
              BottomNavigationBarItem(
                  icon: CustomTabWidget(
                    bloc: bloc,
                    index: 2,
                    icon: Icons.favorite_border,
                  ),
                  label: "",
                  backgroundColor: AppColors.secondary),
              BottomNavigationBarItem(
                  icon: CustomTabWidget(
                    bloc: bloc,
                    index: 3,
                    icon: Icons.person,
                  ),
                  label: "",
                  backgroundColor: AppColors.secondary),
            ],
          ),
        );
      }),
    );
  }
}
