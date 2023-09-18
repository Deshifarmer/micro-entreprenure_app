import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template kpi_body}
/// Body of the KpiPage.
///
/// Add what it does
/// {@endtemplate}
class KpiBody extends StatelessWidget {
  /// {@macro kpi_body}
  const KpiBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'কে পি আই কি ?',
            style: TextStyle(
              fontSize: 18,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '''
কে পি আই (Key Performance Indicator, সংক্ষেপে KPI) একটি মূলত আমাদের প্রকল্পে আপনার কাজের প্রভাব নির্ণয়ন করার জন্য কিছু ব্যবহৃত মাপ । KPI গুলি আপনার সাফল্য বা প্রগতি মাপার জন্য ব্যবহার করা হয়।

আপনার kpi নম্বর গুলা দেখার জন্য এগিয়ে চলুন পরের পাতায় ''',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
