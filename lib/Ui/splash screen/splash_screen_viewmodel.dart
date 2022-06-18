import 'dart:async';

import 'package:animal_detection/app/dependencies.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/constants.dart';
import '../../app/dependencies.locator.dart';

class SplashScreenViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void init(BuildContext context) {
    screenHelper.init(context);
    Timer(const Duration(seconds: 4),
        (() => navigationService.replaceWith(Routes.homePage)));
  }
}
