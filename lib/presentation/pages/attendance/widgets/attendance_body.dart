import 'dart:io';
import 'package:deshifarmer/presentation/pages/attendance/components/check_in_out.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/order.dart';
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
    final loginState = context.read<LoginBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(
        20,
      ),
      child: ListView(
        children: [
          // const Text(
          //   'দৈনিক উপস্থিতি',
          //   style: TextStyle(
          //     fontSize: 18,
          //     color: primaryColor,
          //     fontWeight: FontWeight.w600,
          //   ),
          // ),
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
                const SizedBox(
                  width: 20,
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

//           const Padding(
//             padding: EdgeInsets.only(top: 20),
//             child: Text(
// //               '''আপনি deshifarmer থেকে লজিস্টিক সমর্থন অর্ডার করতে পারেন
// // লজিস্টিক বিক্রেতারা গুদামে তাজা পণ্য পাঠাতে,
// // বাজার বা স্থানীয়রা।

//               '''
// You can order logistic support from deshifarmer
// logistic vendors to send fresh produces to warehouse,
// market or locals.
// ''',
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//             ),
//           ),
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
          ///! TODO: uncomment this
          // FutureBuilder(
          //   future: DeshiFarmerAPI().attendanceHistory(
          //     loginState.successLoginEntity.token,
          //   ),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData &&
          //         ConnectionState.done == snapshot.connectionState) {
          //       print('successully got the data -> ${snapshot.data}');
          //       // print('datatype atthis -> ${snapshot.data.$2}')

          //       final data =
          //           snapshot.data!.$1 as List<AttendaceHistoryEntity>;
          //       print('data -> ${data.length}');

          //       return ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: data.length,
          //         itemBuilder: (context, index) {
          //           final currentHistry = data.elementAt(index);

          //           final int _h = int.parse(currentHistry.work_hour);
          //           // return Text('hola');
          //           print('history -> $currentHistry');
          //           return Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Text(
          //                   currentHistry.date,
          //                   style: const TextStyle(
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.w400,
          //                   ),
          //                 ),

          //                 /// h n p
          //                 Row(
          //                   children: [
          //                     Text(
          //                       '${_h}hrs',
          //                       style: const TextStyle(
          //                         fontSize: 12,
          //                         fontWeight: FontWeight.w400,
          //                       ),
          //                     ),
          //                     Container(
          //                       margin: const EdgeInsets.only(left: 10),
          //                       height: 10,
          //                       width: 200,
          //                       child: FAProgressBar(
          //                         changeProgressColor: Colors.pink,
          //                         backgroundColor: const Color(0xffd9d9d9),
          //                         progressColor: primaryColor,
          //                         verticalDirection: VerticalDirection.up,
          //                         currentValue: _h.toDouble(),
          //                         maxValue: 9,
          //                         // size: 81,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       );
          //       // return Text('sdfl');

          //     } else if (snapshot.connectionState ==
          //         ConnectionState.waiting) {
          //       return const Center(
          //         child: PrimaryLoadingIndicator(),
          //       );
          //     } else {
          //       return const SizedBox.shrink();
          //     }
          //   },
          // ),

          /// list of transaction
        ],
      ),
    );
  }
}
