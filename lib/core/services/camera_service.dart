import 'package:image_picker/image_picker.dart';

class CameraService {
  ImagePicker imagePicker;
  Future getImageFromCamera() async {
    var image = await imagePicker.getImage(source: ImageSource.camera);
    if (image != null) {
      return image;
    }
  }

  Future getImageFromGallery() async {
    var image = await imagePicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    }
  }
}
