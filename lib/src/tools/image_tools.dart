
import 'package:image_picker/image_picker.dart';

class ImageTools {
  final ImagePicker _imagePicker;


  ImageTools({
    ImagePicker? imagePicker,

  })  : _imagePicker = imagePicker ?? ImagePicker();

  bool multiple = false;
  Future<List<XFile>> pickImage(ImageSource imageSource, bool multiple) async {
    if (multiple == true) {
      return await _imagePicker.pickMultiImage();
    } else {
      final file = await _imagePicker.pickImage(source: imageSource);
      if (file != null) {
        return [file];
      }
      return [];
    }
  }

}
