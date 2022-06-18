import 'package:animal_detection/Ui/splash%20screen/splash_screen_viewmodel.dart';
import 'package:animal_detection/app/assets.dart';
import 'package:animal_detection/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.nonReactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        fireOnModelReadyOnce: true,
        onModelReady: (viewModel) => viewModel.init(context),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: Theme.of(context).cardColor,
            body: Center(
              child: Container(
                color: Theme.of(context).cardColor,
                height: screenHelper.screenHeight! * 0.5,
                width: screenHelper.screenWidth! * 0.5,
                child: Image.asset(
                  Assets.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        });
  }
}
