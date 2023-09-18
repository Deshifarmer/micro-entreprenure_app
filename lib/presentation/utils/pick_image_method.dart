import 'package:image_picker/image_picker.dart';

//we can upload image from camera or from gallery based on parameter
Future<XFile?> getImageFromCamera() async {
  final picker = ImagePicker();
  final img = await picker.pickImage(
    source: ImageSource.camera,
    imageQuality: 50,
    maxHeight: 500,
    maxWidth: 500,
  );

  return img;
  // setState(() {
  //   image = img;
  // });
  // if (image != null) {
  //   print('image size state -> ${await image!.length()}');
  // }
}
