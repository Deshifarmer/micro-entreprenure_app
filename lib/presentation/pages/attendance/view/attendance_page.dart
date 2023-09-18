import 'package:deshifarmer/presentation/pages/attendance/widgets/attendance_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// {@template attendance_page}
/// A description for AttendancePage
/// {@endtemplate}
class AttendancePage extends StatelessWidget {
  /// {@macro attendance_page}
  const AttendancePage({
    this.imageFile,
    super.key,
  });
  final XFile? imageFile;

  /// The static route for AttendancePage
  // static Route<dynamic> route() {
  //   return MaterialPageRoute<dynamic>(builder: (_) => AttendancePage());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        surfaceTintColor: backgroundColor2,
        title: const Text(
          'দৈনিক উপস্থিতি',
          style: TextStyle(
            // fontSize: 18,
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: AttendanceView(imageFile: imageFile),
    );
  }
}

/// {@template attendance_view}
/// Displays the Body of AttendanceView
/// {@endtemplate}
class AttendanceView extends StatelessWidget {
  /// {@macro attendance_view}
  const AttendanceView({
    this.imageFile,
    super.key,
  });

  final XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    return AttendanceBody(imageFile: imageFile);
  }
}
