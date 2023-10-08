// import 'package:deshifarmer/presentation/pages/harvest/components/crop_lsit_view_harvest.dart';
// import 'package:deshifarmer/presentation/pages/harvest/components/get_image_for_harvest.dart';
// import 'package:deshifarmer/presentation/pages/harvest/components/harvest_location_field.dart';
// import 'package:deshifarmer/presentation/pages/harvest/components/select_farmer_compo_for_harvest.dart';
// import 'package:deshifarmer/presentation/pages/harvest/model/harvest_model.dart';
// import 'package:deshifarmer/presentation/pages/harvest/pages/harvest_recod_page.dart';
// import 'package:deshifarmer/presentation/pages/harvest/pages/submit_button.dart';
// import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
// import 'package:deshifarmer/presentation/widgets/size_config.dart';
// import 'package:flutter/material.dart';

// class HarvestRecordPage2 extends StatelessWidget {
//   HarvestRecordPage2({super.key});
//   final TextEditingController noteController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor2,
//       appBar: AppBar(
//         surfaceTintColor: backgroundColor2,
//         backgroundColor: backgroundColor2,
//       ),
//       body: ListView(
//         cacheExtent: 1000,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: TextField(
//               controller: noteController,
//               maxLines: 5,
//               decoration: InputDecoration(
//                 // suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
//                 fillColor: backgroundColor2,
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(
//                     color: Colors.black.withOpacity(0.2),
//                   ),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   borderSide: BorderSide(
//                     color: Colors.black.withOpacity(0.2),
//                   ),
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: const BorderRadius.all(Radius.circular(15)),
//                   borderSide: BorderSide(
//                     color: Colors.black.withOpacity(0.2),
//                   ),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   vertical: 20,
//                   horizontal: 15,
//                 ),
//                 labelStyle: const TextStyle(
//                   color: Colors.black,
//                 ),
//                 hintText: '',
//                 filled: true,
//               ),
//             ),
//           ),
//           // a sized box with the height of bottom navigation bar
//           SizedBox(
//             height: getProportionateScreenHeight(80),
//           ),
//         ],
//       ),
//       bottomNavigationBar: ElevatedButton(
//           onPressed: () {
//             print('NOTE -> ${noteController.text}');
//           },
//           child: Text('Press to get data')),
//     );
//   }
// }
