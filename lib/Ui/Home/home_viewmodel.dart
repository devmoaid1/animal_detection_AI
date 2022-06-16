import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:tflite/tflite.dart';

import '../../app/assets.dart';

class HomeViewModel extends BaseViewModel {
  bool _isLoading = true;
  final bool _isVisible = false;
  late File _image;
  late List _output;

  bool get isLoading => _isLoading;
  bool get isVisible => _isVisible;
  File get image => _image;
  List get output => _output;

  final picker = ImagePicker();

  void classifyImage(File image) async {
    final output = await Tflite.runModelOnImage(
        path: image.path,
        threshold: 0.5,
        numResults: 5,
        imageMean: 127.5,
        imageStd: 127.5);

    _output = output!;
    _isLoading = false;
    notifyListeners();
  }

  void loadModel() async {
    await Tflite.loadModel(model: Assets.tfmodel, labels: Assets.labels);
    notifyListeners();
  }

  void pickCameraImage() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    _image = File(image.path);
    classifyImage(_image);
  }

  void pickGalleryImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    _image = File(image.path);
    classifyImage(_image);
  }
}
