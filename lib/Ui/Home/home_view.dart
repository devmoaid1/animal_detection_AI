import 'package:animal_detection/Ui/Home/home_viewmodel.dart';
import 'package:animal_detection/app/screensizing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../widgets/AppButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenHelper = ScreenSizeHelper();

    screenHelper.init(context);

    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Animal Detection',
            style: GoogleFonts.lobster(
                fontSize: screenHelper.blockScreenSizeHorizontal! * 8,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: ViewModelBuilder<HomeViewModel>.reactive(
            viewModelBuilder: () => HomeViewModel(),
            fireOnModelReadyOnce: true,
            onModelReady: (model) => model.loadModel(),
            builder: (context, model, _) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenHelper.blockScreenSizeHorizontal! * 5,
                  vertical: screenHelper.blockScreenSizeVertical! * 6,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenHelper.blockScreenSizeHorizontal! * 5,
                      vertical: screenHelper.blockScreenSizeVertical! * 6,
                    ),
                    width: screenHelper.screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(seconds: 2),
                          child: model.isLoading
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        screenHelper.blockScreenSizeVertical! *
                                            5,
                                  ),
                                  child: Center(
                                    key: const Key('loading'),
                                    child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              : Container(
                                  key: const Key('image'),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SizedBox(
                                            height: screenHelper.screenHeight! *
                                                0.3,
                                            width:
                                                screenHelper.screenWidth! * 0.5,
                                            child: Image.file(model.image,
                                                fit: BoxFit.fill)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      model.output != null
                                          ? Text(
                                              'This is animal is : ${model.output[0]['label']}',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontSize: screenHelper
                                                          .blockScreenSizeHorizontal! *
                                                      4,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: screenHelper.blockScreenSizeVertical! * 10,
                        ),
                        AppButton(
                            handleTap: () => model.pickCameraImage(),
                            title: 'Pick from camera '),
                        SizedBox(
                          height: screenHelper.blockScreenSizeVertical! * 3,
                        ),
                        AppButton(
                            handleTap: () => model.pickGalleryImage(),
                            title: 'Pick From Gallery'),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
