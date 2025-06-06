import 'package:e_commerce/features/data/model/category_model.dart';
import 'package:e_commerce/features/presentation/manager/tabs/state_tab.dart';
import 'package:e_commerce/features/presentation/manager/tabs/tab_event.dart';
import 'package:e_commerce/features/presentation/pages/tabs/category_tab.dart';
import 'package:e_commerce/features/presentation/pages/tabs/fav.dart';
import 'package:e_commerce/features/presentation/pages/tabs/home.dart';
import 'package:e_commerce/features/presentation/pages/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TabBloc extends Bloc<TabsEvent, TabsState> {
  int indexScreen = 0;
  String title = "Home";
  List<Data>? allCategories;
  TextEditingController searchController = TextEditingController();

  static TabBloc get(context) => BlocProvider.of(context);
  TabBloc() : super(TabInitState()) {
    on<OnTabEvent>((event, emit) {
      emit(state.copyWith(indexScreen: event.index));
    });
  }

  void changeScreen(int val) {
    if (val == 0) {
      title = "Home";
    } else if (val == 1) {
      title = "Category";
    } else if (val == 2) {
      title = "Favorite";
    } else if (val == 3) {
      title = "Account";
    }

    add(OnTabEvent(index: val));
  }

  List tabs = [
    HomeTab(),
    CategoryTab(),
    FavTab(),
    Account(),
  ];
}
