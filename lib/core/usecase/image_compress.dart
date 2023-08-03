import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<XFile?> testCompressAndGetFile(File file, String targetPath) async {
  try {
    FlutterImageCompress.validator.ignoreCheckExtName = true;
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      // quality: 80,
      // minHeight: 500,
      // minWidth: 500,
    );

    print('file length -> ${file.lengthSync()}');
    if (result != null) {
      print('successfuuly compressed -> ${await result.length()}');

      return result;
    }
  } catch (e) {
    print('Compressor Exception : ${e}');
  }
  return null;
}
