import 'package:bloc/bloc.dart';

import 'tab_item_state.dart';

class TabItemCubit extends Cubit<TabItemState> {
  TabItemCubit() : super(const TabItemState());

  void onTabItemSelected(int index) {
    emit(TabItemState(
      currentIndex: index,
    ));
  }
}
