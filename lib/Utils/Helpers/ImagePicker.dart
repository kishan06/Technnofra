import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerMethod {
  Future<String> getImage(ImageSource imgSource) async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedImg = await picker.pickImage(source: imgSource);
    if (pickedImg != null) {
      // final File pickedFile = File(pickedImg.path);
      // final int fileSize = await pickedFile.length();

      // // Check if file size is less than 2 MB (2 * 1024 * 1024 bytes)
      // if (fileSize > 2 * 1024 * 1024) {
      //   // File size is greater than 2 MB
      //   return ""; // Return empty string indicating image is too large
      // }
      final croppedImg = await ImageCropper().cropImage(
        sourcePath: pickedImg.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressFormat: ImageCompressFormat.jpg,
        maxHeight: 512,
        maxWidth: 512,
        uiSettings: [
          IOSUiSettings(
            rotateButtonsHidden: true,
            rotateClockwiseButtonHidden: true,
          )
        ],
        compressQuality: 100,
        // cropStyle: CropStyle.circle,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
      );
      if (croppedImg != null) {
        return croppedImg.path;
      } else {
        return "";
      }
    } else {
      return "";
    }
  }
}
