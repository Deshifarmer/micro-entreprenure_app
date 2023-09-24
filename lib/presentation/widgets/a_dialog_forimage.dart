import 'dart:io';

import 'package:deshifarmer/core/usecase/location_current.dart';
import 'package:deshifarmer/data/datasources/remote/apis/attendance_api.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/attendance/bloc/attendance_bloc.dart';
import 'package:deshifarmer/presentation/pages/attendance/view/attendance_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/utils/pick_image_method.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum AttendanceStatus {
  checkIn,
  checkOut,
}

class ImportDialog extends StatefulWidget {
  const ImportDialog({
    required this.attStatus,
    required this.id,
    super.key,
  });

  final AttendanceStatus attStatus;
  final String id;
  @override
  State<ImportDialog> createState() => _ImportDialogState();
}

class _ImportDialogState extends State<ImportDialog> {
  XFile? imageFile;
  final TextEditingController _textEditingController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor2,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'আপনার ছবি যোগ করুন',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (imageFile == null)
                    Center(
                      child: Column(
                        children: [
                          /// you have to open the camera to give attendance
                          Text(
                            'উপস্থিতি দেওয়ার জন্য আপনাকে ক্যামেরাটি খুলতে হবে',
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: SecondayButtonGreen(
                              // borderRadiusAll: 4,
                              // elevation: 2,
                              onpress: () async {
                                final imageFile = await getImageFromCamera();
                                setState(() {
                                  this.imageFile = imageFile;
                                });
                              },
                              title: 'ক্যামেরা খুলুন',
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    // show the image
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 8),
                      child: Image.file(
                        File(imageFile!.path),
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),

                  /// a text field for check out/in note
                  if (imageFile != null)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'কোন নোট থাকলে লিখুন',
                          hintStyle: theme.textTheme.bodyMedium!.copyWith(
                            color: Colors.grey,
                          ),
                          fillColor: backgroundColor2,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (imageFile != null)
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 12),
                alignment: AlignmentDirectional.centerEnd,
                child: isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(8),
                        child: PrimaryLoadingIndicator(),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SecondayButtonGreen(
                            onpress: () async {
                              final location = await determinePosition();
                              setState(() {
                                isLoading = true;
                              });
                              final loginState =
                                  context.read<LoginBloc>().state;
                              final token = loginState is LoginSuccess
                                  ? loginState.successLoginEntity.token
                                  : '';
                              // get the user loation

                              // call the check in api
                              switch (widget.attStatus) {
                                case AttendanceStatus.checkIn:
                                  final api = await AttendanceAPI().checkInAPI(
                                    token,
                                    _textEditingController.text,
                                    imageFile!.path,
                                    location.latitude,
                                    location.longitude,
                                  );
                                  // if success then navigate to attendance page
                                  if (api.$1) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const AttendancePage(),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      errorSnackBar(
                                        'চেক আউট ব্যর্থ হয়েছে',
                                      ),
                                    );
                                  }
                                case AttendanceStatus.checkOut:
                                  final api = await AttendanceAPI().checkOut(
                                    //id
                                    token,
                                    widget.id,
                                    _textEditingController.text,
                                    imageFile!.path,
                                    location.latitude,
                                    location.longitude,
                                  );
                                  // if success then navigate back
                                  if (api.$1) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.of(context).pop();
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      errorSnackBar(
                                        'চেক আউট ব্যর্থ হয়েছে',
                                      ),
                                    );
                                  }
                              }
                            },
                            title: widget.attStatus == AttendanceStatus.checkIn
                                ? 'চেক ইন করুন'
                                : "চেক আউট করুন",
                          )
                        ],
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
