// import 'package:deshifarmer/core/params/batch_params.dart';
// import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
// import 'package:flutter/material.dart';

// class FinanceSeasonSelect extends StatefulWidget {
//   const FinanceSeasonSelect({
//     super.key,
//   });

//   @override
//   State<FinanceSeasonSelect> createState() => _FinanceSeasonSelectState();
// }

// class _FinanceSeasonSelectState extends State<FinanceSeasonSelect> {
//   String _season = '';
//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: DropdownButtonFormField<String>(
//           borderRadius: const BorderRadius.all(Radius.circular(15)),
//           focusColor: backgroundColor2,
//           dropdownColor: backgroundColor2,
//           isExpanded: true,
//           decoration: const InputDecoration(
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 5,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//             filled: true,
//             fillColor: backgroundColor2,
//             // contentPadding: EdgeInsets.all(10),
//           ),
//           // decoration: ShapeDecoration(),

//           elevation: 16,
//           // value: BatchParams.seasons.first,
//           items:
//               BatchParams.seasons.map<DropdownMenuItem<String>>((String value) {
//             return DropdownMenuItem<String>(
//               // alignment: Alignment.center,
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           hint: const Text('Season'),
//           onChanged: (String? val) {
//             if (val != null) {
//               // _seasonController.text = val;
//               setState(() {
//                 _season = val;
//               });
//               debugPrint('new season -> $_season');
//             }
//             // if (state is RecordSowingInitial) {
//             //   state.quantity.text = val.toString();
//             // }
//           },
//         ),
//       );
// }
