@StackedApp(routes: [
  CupertinoRoute(page: HomePage),
  CupertinoRoute(page: SplashScreen, initial: true)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
])
import 'package:animal_detection/Ui/Home/home_view.dart';
import 'package:animal_detection/Ui/splash%20screen/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
