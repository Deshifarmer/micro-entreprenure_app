// import 'package:deshifarmer/core/app_strings.dart';
// import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
// import 'package:deshifarmer/presentation/widgets/constraints.dart';
// import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
// import 'package:flutter/material.dart';

// import '../../../widgets/size_config.dart';

// class ProfileHelpPage extends StatelessWidget {
//   const ProfileHelpPage({
//     required this.fullName,
//     required this.farmerID,
//     required this.farmerPhoto,
//     super.key,
//   });

//   final String? fullName;
//   final String? farmerID;
//   final String? farmerPhoto;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: ListView(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Colors.transparent,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.network(
//                   checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
//                       ? dummyImage
//                       : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/$farmerPhoto',
//                   fit: BoxFit.cover,
//                   /* errorBuilder: (
//                         context,
//                         error,
//                         stackTrace,
//                       ) {
//                         return Center(
//                           child: Text(
//                             'Image Error',
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleSmall!
//                                 .copyWith(
//                                   color: Colors.redAccent,
//                                   fontStyle: FontStyle.italic,
//                                 ),
//                           ),
//                         );
// ss                       }, */
//                 ),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: Text(
//                 fullName ?? '',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),

//             /// code
//             Text(
//               '#$farmerID',
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: getProportionateScreenHeight(40),
//             ),
//             const ListTile(
//               title: Text(
//                 'আমরা আপনাকে কীভাবে সাহায্য করতে পারি  ?',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             // Text('আমরা আপনাকে কীভাবে সাহায্য করতে পারি  ?'),
//             const ListTile(
//               title: Text(
//                 'অর্ডারের কতদিনের মধ্যে পণ্য হাতে আসবে ?',
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//               trailing: Icon(Icons.navigate_next),
//             ),

//             const ListTile(
//               title: Text(
//                 'কমিশন কিভাৱে পাব ?',
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//               trailing: Icon(Icons.navigate_next),
//             ),
//             const ListTile(
//               title: Text(
//                 'কৃষকদের পণ্য কোথায় বিক্রি করা হয় ?',
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//               trailing: Icon(Icons.navigate_next),
//             ),
//             const ListTile(
//               title: Text(
//                 'কিভাবে নতুন কৃষক যোগ করব ?',
//                 style: TextStyle(
//                   fontSize: 14,
//                 ),
//               ),
//               trailing: Icon(Icons.navigate_next),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: SecondayButtonGreen(
//           onpress: () {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 backgroundColor: priceBoxColor,
//                 content: const Text('This is Under progress'),
//                 action: SnackBarAction(label: 'Okay', onPressed: () {}),
//               ),
//             );
//           },
//           title: 'Update Settings',),
//     );
//   }
// }
