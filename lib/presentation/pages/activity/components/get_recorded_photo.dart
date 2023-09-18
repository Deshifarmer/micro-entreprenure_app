import 'dart:io';

import 'package:deshifarmer/presentation/blocs/record_sowing/record_sowing_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RecordActivityPicUpload extends StatefulWidget {
  const RecordActivityPicUpload({
    super.key,
  });

  @override
  State<RecordActivityPicUpload> createState() =>
      _RecordActivityPicUploadState();
}

class _RecordActivityPicUploadState extends State<RecordActivityPicUpload> {
  List<XFile> images = [];

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future<void> getImage(ImageSource media) async {
    // final appDocumentsDir = await getTemporaryDirectory();
    final img = await picker.pickMultipleMedia(
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
                final recordSowingState =
                    context.read<RecordSowingBloc>().state;
                print('current image index -> $index');
                final currentImage = images.elementAt(index);
                if (recordSowingState is RecordSowingInitial) {
                  recordSowingState.images.addAll(images.toSet().toList());

                  ///! check if the file already exists or not
                }
                return Padding(
                  padding: const EdgeInsets.all(8),
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
          : SizedBox(
              height: 150,
              width: MediaQuery.sizeOf(context).width / 1.1,
              child: DottedBorder(
                padding: const EdgeInsets.all(8),
                borderPadding: const EdgeInsets.all(8),
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                strokeWidth: 0.6,
                child: const Center(
                  child: Text('ফটো আপলোড করুন'),
                  // child: Text('Tap to upload a photo'),
                ),
              ),
            ),
    );
  }
}
