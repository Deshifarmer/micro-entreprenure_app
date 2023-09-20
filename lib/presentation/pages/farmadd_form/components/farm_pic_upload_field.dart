import 'dart:io';

import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/bloc/farmadd_form_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FarmerProfilePicUpload extends StatefulWidget {
  const FarmerProfilePicUpload({
    super.key,
  });

  @override
  State<FarmerProfilePicUpload> createState() => _FarmerProfilePicUploadState();
}

class _FarmerProfilePicUploadState extends State<FarmerProfilePicUpload> {
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
                final farmAddState = context.read<FarmaddFormBloc>().state;
                print('current image index -> $index');
                final currentImage = images.elementAt(index);
                if (farmAddState is FarmaddFormInitial) {
                  farmAddState.images.addAll(images.toSet().toList());

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
              height: 250,
              width: 200,
              child: DottedBorder(
                padding: const EdgeInsets.all(8),
                borderPadding: const EdgeInsets.all(8),
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                strokeWidth: 0.6,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ///! upload icon
                      Icon(
                        CupertinoIcons.cloud_upload,
                        size: 100,
                      ),

                      ///! drop multi files here
                      Text('Drop your files here'),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
