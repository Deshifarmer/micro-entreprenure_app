import 'dart:io';
import 'package:deshifarmer/presentation/pages/attendance/components/check_in_out.dart';
import 'package:deshifarmer/presentation/pages/attendance/widgets/checkin_history.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// {@template attendance_body}
/// Body of the AttendancePage.
///
/// Add what it does
/// {@endtemplate}
class AttendanceBody extends StatelessWidget {
  /// {@macro attendance_body}
  const AttendanceBody({
    this.imageFile,
    super.key,
  });

  final XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    // final loginState = context.read<LoginBloc>().state;
    // final token = (loginState as LoginSuccess).successLoginEntity.token;
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width / 2.4,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  // margin: const EdgeInsets.all(5),
                  height: getProportionateScreenHeight(150),
                  decoration: BoxDecoration(
                    color: priceBoxColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0 দিন',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          'উপস্থিত',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        child: Text(
                          'এই মাসে',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width / 2.4,
                  padding: const EdgeInsets.all(10),
                  // margin: const EdgeInsets.all(5),
                  height: getProportionateScreenHeight(150),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0%',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Text(
                          'অনুপাত',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        child: Text(
                          'এই মাসে',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.black,
                                    fontSize: 8,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),

          if (imageFile != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(
                File(imageFile!.path),
                height: getProportionateScreenHeight(100),
                width: getProportionateScreenWidth(100),
              ),
            ),

          widgetHeight(getProportionateScreenHeight(20)),
          // const CheckInNOut(),
          // CheckInOut(),
          CheckInOut(imageFile: imageFile),
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),

          ///! last 7 days
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'বিগত ৭ কর্মদিবস',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // if (loginState is LoginSuccess)
          const CheckInHistory(),

          /// list of transaction
        ],
      ),
    );
  }
}
