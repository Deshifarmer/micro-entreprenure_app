import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/attendance/bloc/attendance_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/shapes/play_arror_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/a_dialog_forimage.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CheckInOut extends StatelessWidget {
  const CheckInOut({this.imageFile, super.key});

  final XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        if (state is AttendanceLoading) {
          return const Center(
            child: PrimaryLoadingIndicator(),
          );
        } else if (state is AttendanceSuccess) {
          // print('check out data -> ${state.todays.check_out}');
          // print('check in data -> ${state.todays.check_in}');
          // print('employee_id -> ${state.todays.employee_id}');
          if (state.todays.check_out != null) {
            /// already checked out at (time) today
            return Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.stop, size: 32, color: Colors.green),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'You already checked out at ',
                        style: const TextStyle(
                          color: secondaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: '${state.todays.check_out}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return Column(
            children: [
              Row(
                children: [
                  if (state.todays.check_out == null)
                    CustomPaint(
                      painter: PlayArrowShape(),
                      size: const Size(32, 32),
                    )
                  else
                    const Icon(Icons.stop, size: 32, color: Colors.green),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  if (state.todays.check_out == null)
                    RichText(
                      text: TextSpan(
                        text: 'You checked in at ',
                        style: const TextStyle(
                          color: secondaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: '${state.todays.check_in} today',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    RichText(
                      text: TextSpan(
                        text: 'You checked out at ',
                        style: const TextStyle(
                          color: secondaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: '${state.todays.check_out}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              if (state.todays.check_out == null) ...[
                const Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black,
                ),
                SecondayButtonGreen(
                  btnColor: priceBoxColor,
                  onpress: () async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext context) => ImportDialog(
                        attStatus: AttendanceStatus.checkOut,
                        id: state.todays.id.toString(),
                      ),
                    );
                    // print('c out');
                    // final attState = context.read<AttendanceBloc>().state;
                    // final loginState = context.read<LoginBloc>().state;
                    // if (loginState is LoginSuccess) {
                    // final imageFile = await getImageFromCamera();
                    // if (imageFile == null) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     errorSnackBar(
                    //       'Image not selected',
                    //     ),
                    //   );
                    // } else {
                    // context.read<AttendanceBloc>().add(
                    //       CheckOutEvent(
                    //         token: loginState.successLoginEntity.token,
                    //         imageFile: imageFile.path,
                    //         id: state.todays.id.toString(),
                    //         lat:
                    //       ),
                    //     );
                    // if (attState is AttendanceOut) {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   successSnackBar('Check out Successfully'),
                    // );
                    // Navigator.pop(context);
                    // Navigator.pop(context);
                    // }
                    // Navigator.push(
                    //     context, AttendancePage.route());
                    // }
                    // }
                    // setState(() {
                    //   isCheck = false;
                    // });
                  },
                  title: 'চেকআউট করুন',
                ),
              ],
            ],
          );
        }
        return SecondayButtonGreen(
          btnColor: priceBoxColor,
          onpress: () {
            final loginState = context.read<LoginBloc>().state;
            if (loginState is LoginSuccess && imageFile != null) {
              context.read<AttendanceBloc>().add(
                    CheckInEvent(
                      token: loginState.successLoginEntity.token,
                      imageFile: imageFile!.path,
                    ),
                  );
            }
            final attState = context.read<AttendanceBloc>().state;
            if (attState is AttendanceSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(successSnackBar('Check In Successfully'));
            } else if (attState is AttendanceError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar(attState.msg ?? ''));
            }
          },
          title: 'চেক ইন করুন',
        );
      },
      listener: (context, state) {
        if (state is AttendanceError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar(state.msg ?? ''));
        }
      },
    );
  }
}
