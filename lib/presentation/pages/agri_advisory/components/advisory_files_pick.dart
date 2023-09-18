import 'dart:io';
import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdvisoryFileUploadField extends StatefulWidget {
  const AdvisoryFileUploadField({super.key});

  @override
  @override
  State<AdvisoryFileUploadField> createState() =>
      _AdvisoryFileUploadFieldState();
}

@override
@override
class _AdvisoryFileUploadFieldState extends State<AdvisoryFileUploadField> {
  List<XFile> images = [];
  @override
  @override
  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future<void> getImage(ImageSource media) async {
    // final appDocumentsDir = await getTemporaryDirectory();
    final img = await picker.pickMultiImage(
      // source: media,
      imageQuality: 50,
      maxHeight: 500,
      maxWidth: 500,
    );

    setState(() {
      // images = img;
      images.addAll(img);
    });
    print('images length -> ${images.length}');
    // if (images  != null) {
    //   // print('image size state -> ${await images.length()}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getImage(ImageSource.gallery);
      },
      child: images.isNotEmpty
          ? GridView.builder(
              shrinkWrap: true,
              // crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final agriAdvisory = context.read<AgriAdvisoryBloc>().state;
                // print('current image index -> $index');
                final currentImage = images.elementAt(index);
                if (agriAdvisory is AgriAdvisoryInitial) {
                  agriAdvisory.images.addAll(images.toSet().toList());
                  // /! check if the file already exists or not
                }
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      File(currentImage.path),
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                );
              },
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Record a video/take a photo',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Select a file',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
    );
  }
}
