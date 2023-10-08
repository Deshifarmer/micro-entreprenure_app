import 'dart:io';

import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImageForHarvest extends StatefulWidget {
  const GetImageForHarvest({
    required this.selectIMGController,
    super.key,
  });

  final TextEditingController? selectIMGController;

  @override
  State<GetImageForHarvest> createState() => _GetImageForHarvestState();
}

class _GetImageForHarvestState extends State<GetImageForHarvest> {
  ///* upload picture

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future<void> getImage(ImageSource media) async {
    final img = await picker.pickImage(
      source: media,
      imageQuality: 80,
      maxHeight: 500,
      maxWidth: 500,
    );

    setState(() {
      image = img;
    });
    if (image != null) {
      print(
          'image size is -> ${await image!.length()} and path -> ${image!.path}');
      widget.selectIMGController?.text = image!.path;
      print(
          'image path from controller -> ${widget.selectIMGController?.text}');
    }
  }

  //show popup dialog
  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('একটি পদ্ধতি নির্বাচন করুন'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                ElevatedButton(
                  //if user click this button, user can upload image from gallery
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(priceBoxColor),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      const Text(
                        'From Gallery',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(priceBoxColor),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  //if user click this button. user can upload image from camera
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.camera,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      const Text(
                        'From Camera',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///* Upload picture GONE
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await getImage(ImageSource.gallery);
      },
      child: image != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.file(
                File(
                  image!.path,
                ),
                fit: BoxFit.cover,
                height: 250,
              ),
            )
          : DottedBorder(
              radius: const Radius.circular(15),
              borderType: BorderType.RRect,
              borderPadding: const EdgeInsets.all(10),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ছবি আপলোড করুন',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
