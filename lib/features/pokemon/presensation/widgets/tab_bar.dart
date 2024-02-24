import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/tab_item_cubit/tab_item_cubit.dart';
import '../blocs/tab_item_cubit/tab_item_state.dart';
import 'tab_item.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  List<String> tabItems = <String>['About', 'Stats', 'Similar'];
  int _onTappedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 100,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<TabItemCubit, TabItemState>(
          builder: (context, state) {
            return SizedBox(
              height: double.infinity,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tabItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          context.read<TabItemCubit>().onTabItemSelected(index);
                          setState(() {
                            _onTappedIndex = index;
                          });
                        },
                        child: BlocBuilder<TabItemCubit, TabItemState>(
                          bloc: TabItemCubit(),
                          builder: (context, state) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: index == _onTappedIndex
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: TabItem(
                                text: tabItems[index],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
