import 'package:e_commerce/features/presentation/manager/search/event_seaarch.dart';
import 'package:e_commerce/features/presentation/manager/search/state_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSearch extends Bloc<EventSearch, StateSearch> {
  final TextEditingController searchController = TextEditingController();

  BlocSearch() : super(StateInitSearch());

  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
