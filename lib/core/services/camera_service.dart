import 'package:image_picker/image_picker.dart';

class CameraService {
  Future getImageFromCamera() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    if (image != null) {
      return image;
    }
  }

  Future getImageFromGallery() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image;
    }
  }
}
