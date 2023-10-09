import 'dart:io';

import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
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
      debugPrint('image size state -> ${await image!.length()}');
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

  @override
  Widget build(BuildContext context) {
    debugPrint('this is image path -> ${image?.path} from Build Widget');
    final state = context.read<AddFarmerBloc>().state;
    if (image != null && state is AddFarmerInitial) {
      state.farmerImageController.text = image!.path;
    }
    return Center(
      child: InkWell(
        onTap: myAlert,
        child: SizedBox(
          height: getProportionateScreenHeight(250),
          width: getProportionateScreenWidth(200),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            // padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            child: state is AddFarmerInitial
                ? image != null || state.farmerImageController.text.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(image?.path ?? state.farmerImageController.text),
                          fit: BoxFit.cover,
                          height: 250,
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 200,
                      )
                : const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 200,
                  ),
          ),
        ),
      ),
    );
  }
}
