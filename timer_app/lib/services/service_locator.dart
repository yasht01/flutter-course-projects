import 'package:get_it/get_it.dart';
import 'package:timer_app/pages/timer_page_logic.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<TimerPageManager>(
    () => TimerPageManager()
  );
}