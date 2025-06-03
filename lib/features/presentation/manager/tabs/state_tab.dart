class TabsState {
  final int indexScreen;

  const TabsState({required this.indexScreen});

  TabsState copyWith({int? indexScreen}) {
    return TabsState(
      indexScreen: indexScreen ?? this.indexScreen,
    );
  }
}

class TabInitState extends TabsState {
  TabInitState({int indexScreen = 0}) : super(indexScreen: indexScreen);
}
