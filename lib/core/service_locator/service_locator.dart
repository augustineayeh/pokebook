import 'package:get_it/get_it.dart';
import 'package:pokebook/features/pokemon/presensation/blocs/tab_item_cubit/nav_item_cubit.dart';
import 'package:pokebook/features/pokemon/presensation/blocs/theme_cubit/theme_cubit.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<TabItemCubit>(() => TabItemCubit());
  locator.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
