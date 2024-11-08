import 'package:get_it/get_it.dart';

import '../db/database_helper.dart';
import '../repositories/item_repository.dart';
import '../view_models/item_view_model.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  getIt.registerLazySingleton<ItemRepository>(() => ItemRepository(getIt<DatabaseHelper>()));
  getIt.registerFactory(() => ItemViewModel(getIt<ItemRepository>()));
}
