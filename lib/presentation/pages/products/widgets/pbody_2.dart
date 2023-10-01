// import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
// import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
// import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
// import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
// import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
// import 'package:deshifarmer/presentation/pages/products/components/cart_btn_components.dart';
// import 'package:deshifarmer/presentation/pages/products/components/category_menu_items.dart';
// import 'package:deshifarmer/presentation/pages/products/components/company_c_list_view.dart';
// import 'package:deshifarmer/presentation/pages/products/pages/view_companies.dart';
// import 'package:deshifarmer/presentation/pages/products/widgets/product_gird_view.dart';
// import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
// import 'package:deshifarmer/presentation/widgets/constraints.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// /// {@template products_body}
// /// Body of the ProductsPage.
// ///
// /// Add what it does
// /// {@endtemplate}
// class ProductsBody2 extends StatefulWidget {
//   /// {@macro products_body}
//   ProductsBody2({
//     required this.token,
//     super.key,
//   });

//   final String token;

//   @override
//   State<ProductsBody2> createState() => _ProductsBody2State();
// }

// class _ProductsBody2State extends State<ProductsBody2> {
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     final loginState = context.read<LoginBloc>().state;

//     final productState = context.read<ProductsBloc>().state;
//     final categoryState = context.read<CategoryBloc>().state;
//     return NestedScrollView(
//       physics: const NeverScrollableScrollPhysics(),
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return [
//           SliverAppBar(
//             title: const Text('পণ্য কিনুন'),

//             /// PERF: Back Button
//             leading: IconButton(
//               onPressed: () {
//                 // context.read<ProductsBloc>().add(const UnSelectCompanyEvent());
//                 ///! TODO: uncomment this
//                 // context.read<ProductsBloc>().add(SelectCompanysEvent(
//                 //       '',
//                 //       query: '',
//                 //       category: '',
//                 //     ));
//                 final loginState = context.read<LoginBloc>().state;
//                 if (loginState is LoginSuccess) {
//                   context.read<UserProfileBloc>().add(
//                         GetUserProfileEvent(
//                           token: loginState.successLoginEntity.token,
//                         ),
//                       );

//                   /// fore clearning the prev state
//                   ///! TODO: uncomment this
//                   // context.read<ProductsBBloc>().add(
//                   //       ProductSearchEvent(
//                   //         loginState.successLoginEntity.token,
//                   //       ),
//                   //     );
//                 }

//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.navigate_before),
//             ),
//             actions: const [
//               ///! PERF: Cart Button
//               CartBtnPP(),
//             ],
//             // floating: true, pinned: false, snap: false,
//             bottom: PreferredSize(
//               preferredSize: Size(MediaQuery.sizeOf(context).width, 70),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           bottom: 10,
//                           top: 10,
//                           right: 10,
//                         ),

//                         ///! PERF: Searching Text Field
//                         child: TextField(
//                           onChanged: (value) {
//                             ///! TODO: uncomment this
//                             ///! PERF: 1st. check if theres any company/cat already select

//                             if (productState is ProductComanySelect) {
//                               ///! TODO: Implement the Search functionality with holding the prev args
//                               context.read<ProductsBloc>().add(
//                                     SelectCompanysEvent(
//                                       productState.companyID,
//                                       category: productState.category,
//                                       query: value.isEmpty ? '' : value,
//                                     ),
//                                   );

//                               if (loginState is LoginSuccess) {
//                                 context.read<ProductsBBloc>().add(
//                                       ProductSearchEvent(
//                                         loginState.successLoginEntity.token,
//                                         query: value.isEmpty ? '' : value,
//                                         cat: productState.category,
//                                         company: productState.companyID,
//                                         // cat: productState.category,
//                                         // company: productState.companyID,
//                                       ),
//                                     );
//                               }
//                             } else {
//                               ///! TODO: Implement the Search functionality with holding the prev args
//                               context.read<ProductsBloc>().add(
//                                     SelectCompanysEvent(
//                                       '',
//                                       category: '',
//                                       query: value.isEmpty ? '' : value,
//                                     ),
//                                   );

//                               if (loginState is LoginSuccess) {
//                                 context.read<ProductsBBloc>().add(
//                                       ProductSearchEvent(
//                                         loginState.successLoginEntity.token,
//                                         query: value.isEmpty ? '' : value,
//                                         // cat: productState.category,
//                                         // company: productState.companyID,
//                                       ),
//                                     );
//                               }
//                             }
//                           },
//                           decoration: InputDecoration(
//                             contentPadding: const EdgeInsets.all(8),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius:
//                                   BorderRadius.circular(uiBorderRadius),
//                             ),
//                             // focusedErrorBorder: OutlineInputBorder(),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                             ),
//                             prefixIcon: const Icon(
//                               Icons.search,
//                               color: Color(0xff757575),
//                             ),
//                             hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
//                             filled: true,
//                             fillColor: Colors.white70,
//                             hintStyle: const TextStyle(
//                               color: Color(0xff6a6a6a),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const CategoryMenuItems()

//                     // if (categoryState is CategorySuccess)

//                     //   ,
//                   ],
//                 ),
//               ),
//             ),
//             // pinned: false,
//             // snap: true,
//             // forceMaterialTransparency: true,
//             // expandedHeight: 400,
//             // toolbarHeight: 200,
//             // collapsedHeight: 200,
//             /* flexibleSpace: Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       bottom: 10,
//                       top: 10,
//                       right: 10,
//                     ),
//                     child: TextField(
//                       onChanged: (value) {
//                         ///! TODO: Implement the Search functionality with holding the prev args
//                         context.read<ProductsBloc>().add(
//                               SelectCompanysEvent(
//                                 '',
//                                 category: '',
//                                 query: value,
//                               ),
//                             );

//                         if (loginState is LoginSuccess) {
//                           context.read<ProductsBBloc>().add(
//                                 ProductSearchEvent(
//                                   loginState.successLoginEntity.token,
//                                   query: value,
//                                   // cat: productState.category,
//                                   // company: productState.companyID,
//                                 ),
//                               );
//                         }
//                       },
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.all(8),
//                         // disabledBorder: OutlineInputBorder(),
//                         // focusedBorder: OutlineInputBorder(),
//                         // errorBorder: OutlineInputBorder(),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(uiBorderRadius),
//                         ),
//                         // focusedErrorBorder: OutlineInputBorder(),
//                         border: const OutlineInputBorder(
//                             borderSide: BorderSide.none),
//                         prefixIcon:
//                             const Icon(Icons.search, color: Color(0xff757575)),
//                         hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
//                         filled: true,
//                         fillColor: Colors.white70,
//                         hintStyle: const TextStyle(
//                           color: Color(0xff6a6a6a),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (categoryState is CategorySuccess)
//                   PopupMenuButton<CategoryEntity>(
//                     padding: const EdgeInsets.all(0),
//                     // surfaceTintColor: primaryColor,
//                     onSelected: (CategoryEntity value) {
//                       print(
//                         'cat selected -> title:${value.title} \nid ${value.id} \n${value.id}',
//                       );

//                       ///! TODO: when user selects the company
//                       if (productState is ProductComanySelect) {
//                         context.read<ProductsBloc>().add(
//                               SelectCompanysEvent(
//                                 productState.companyID,
//                                 category: value.id.toString(),
//                                 query: productState.query,
//                               ),
//                             );
//                         final loginState = context.read<LoginBloc>().state;
//                         // print(
//                         //     'cat -> ${productState.category} | ${value.title} company -> ${productState.companyID}');
//                         if (loginState is LoginSuccess) {
//                           context.read<ProductsBBloc>().add(
//                                 ProductSearchEvent(
//                                   loginState.successLoginEntity.token,
//                                   cat: value.id.toString(),
//                                   // cat: productState.category,
//                                   company: productState.companyID.isNotEmpty
//                                       ? productState.companyID
//                                       : null,
//                                 ),
//                               );
//                         }
//                       } else {
//                         /// when user unselects the company
//                         context.read<ProductsBloc>().add(
//                               SelectCompanysEvent(
//                                 '',
//                                 category: value.id.toString(),
//                                 query: '',
//                               ),
//                             );

//                         final loginState = context.read<LoginBloc>().state;
//                         print('cat -> ${value.title} ${value.id}');
//                         if (loginState is LoginSuccess) {
//                           context.read<ProductsBBloc>().add(
//                                 ProductSearchEvent(
//                                   loginState.successLoginEntity.token,
//                                   cat: value.id.toString(),
//                                 ),
//                               );
//                         }
//                       }
//                     },
//                     itemBuilder: (BuildContext context) =>
//                         categoryState.allCategoryListResp.category
//                             .map(
//                               (CategoryEntity e) =>
//                                   PopupMenuItem<CategoryEntity>(
//                                 value: e,
//                                 child: Text(e.title),
//                               ),
//                             )
//                             .toList(),
//                     color: Colors.white,
//                     icon: Container(
//                       // margin: EdgeInsets.all(0),
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 10,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         border: Border.all(
//                           width: 0.6,
//                           // strokeAlign: 0.6,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       child: Icon(
//                         Icons.menu,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//               ],
//             ), */
//           ),
//         ];
//       },

//       body: Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 10,
//         ),
//         child: ListView(
//           cacheExtent: 1000,
//           physics: const BouncingScrollPhysics(),
//           controller: _scrollController
//             ..addListener(() {
//               if (_scrollController.offset >
//                   _scrollController.position.maxScrollExtent * 0.8) {
//                 final pb = context.read<ProductsBBloc>().state;
//                 // print('goin 60% of the screen -> $pb');
//                 ///! TODO: uncomment this
//                 if (pb is ProductSSuccess) {
//                   // print('success productsssssssss');
//                   if (pb.productEntity.links?.next != null) {
//                     //? fetch the nxt page
//                     if (loginState is LoginSuccess) {
//                       // print(
//                       //   'nexty page ${pb.productEntity.links?.next} ${loginState.successLoginEntity.token}',
//                       // );
//                       context.read<ProductsBBloc>().add(
//                             ProductFFetchPaginationEvent(
//                               nextPage: pb.productEntity.links!.next!,
//                               token: loginState.successLoginEntity.token,
//                             ),
//                           );
//                     }
//                   }
//                   /* else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       errorSnackBar('Reached at the end of the List!'),
//                     );
//                   } */
//                 } else {
//                   print('not success product');
//                 }
//                 // print(
//                 //     'offset -> ${_scrollController.offset} || ${_scrollController.position.maxScrollExtent * 0.6}');
//                 // print('aaaaaaaaaaaaaaaaaaa');
//                 // print(
//                 //   _scrollController.offset >
//                 //       _scrollController.position.maxScrollExtent * 0.6,
//                 // );
// // ProductsBBloc
//                 //? check if the next page is not [null]
//                 // state.productEntity.links.next
//                 // final nxtPage =
//                 //     state.productEntity.links?.next?.split('=').last;

//                 // print('end of the page $nxtPage');
//                 // }
//               }
//             }),
//           children: [
//             /// TextField
//             /* Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       bottom: 10,
//                       top: 10,
//                       right: 10,
//                     ),
//                     child: TextField(
//                       onChanged: (value) {
//                         ///! TODO: Implement the Search functionality with holding the prev args
//                         context.read<ProductsBloc>().add(
//                               SelectCompanysEvent(
//                                 '',
//                                 category: '',
//                                 query: value,
//                               ),
//                             );

//                         if (loginState is LoginSuccess) {
//                           context.read<ProductsBBloc>().add(
//                                 ProductSearchEvent(
//                                   loginState.successLoginEntity.token,
//                                   query: value,
//                                   // cat: productState.category,
//                                   // company: productState.companyID,
//                                 ),
//                               );
//                         }
//                       },
//                       decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.all(8),
//                         // disabledBorder: OutlineInputBorder(),
//                         // focusedBorder: OutlineInputBorder(),
//                         // errorBorder: OutlineInputBorder(),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(uiBorderRadius),
//                         ),
//                         // focusedErrorBorder: OutlineInputBorder(),
//                         border: const OutlineInputBorder(
//                             borderSide: BorderSide.none),
//                         prefixIcon:
//                             const Icon(Icons.search, color: Color(0xff757575)),
//                         hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
//                         filled: true,
//                         fillColor: Colors.white70,
//                         hintStyle: const TextStyle(
//                           color: Color(0xff6a6a6a),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 if (categoryState is CategorySuccess)
//                   PopupMenuButton<CategoryEntity>(
//                     padding: const EdgeInsets.all(0),
//                     // surfaceTintColor: primaryColor,
//                     onSelected: (CategoryEntity value) {
//                       print(
//                         'cat selected -> title:${value.title} \nid ${value.id} \n${value.id}',
//                       );

//                       ///! TODO: when user selects the company
//                       if (productState is ProductComanySelect) {
//                         context.read<ProductsBloc>().add(
//                               SelectCompanysEvent(
//                                 productState.companyID,
//                                 category: value.id.toString(),
//                                 query: productState.query,
//                               ),
//                             );
//                         final loginState = context.read<LoginBloc>().state;
//                         // print(
//                         //     'cat -> ${productState.category} | ${value.title} company -> ${productState.companyID}');
//                         if (loginState is LoginSuccess) {
//                           context.read<ProductsBBloc>().add(
//                                 ProductSearchEvent(
//                                   loginState.successLoginEntity.token,
//                                   cat: value.id.toString(),
//                                   // cat: productState.category,
//                                   company: productState.companyID.isNotEmpty
//                                       ? productState.companyID
//                                       : null,
//                                 ),
//                               );
//                         }
//                       } else {
//                         /// when user unselects the company
//                         context.read<ProductsBloc>().add(
//                               SelectCompanysEvent(
//                                 '',
//                                 category: value.id.toString(),
//                                 query: '',
//                               ),
//                             );

//                         final loginState = context.read<LoginBloc>().state;
//                         print('cat -> ${value.title} ${value.id}');
//                         if (loginState is LoginSuccess) {
//                           context.read<ProductsBBloc>().add(
//                                 ProductSearchEvent(
//                                   loginState.successLoginEntity.token,
//                                   cat: value.id.toString(),
//                                 ),
//                               );
//                         }
//                       }
//                     },
//                     itemBuilder: (BuildContext context) =>
//                         categoryState.allCategoryListResp.category
//                             .map(
//                               (CategoryEntity e) =>
//                                   PopupMenuItem<CategoryEntity>(
//                                 value: e,
//                                 child: Text(e.title),
//                               ),
//                             )
//                             .toList(),
//                     color: Colors.white,
//                     icon: Container(
//                       // margin: EdgeInsets.all(0),
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 10,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         border: Border.all(
//                           width: 0.6,
//                           // strokeAlign: 0.6,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       child: Icon(
//                         Icons.menu,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//              */
// //TODO:undo this
//             Container(
//               // color: backgroundColor2,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(
//                   width: 0.6,
//                   // strokeAlign: 0.6,
//                   color: Colors.grey,
//                 ),
//               ),
//               margin: const EdgeInsets.only(
//                 bottom: 10,
//               ),
//               // elevation: 1,
//               // margin: const EdgeInsets.only(
//               //   bottom: 20,
//               // ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   //! TODO: undo this (PROBLEM)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 10,
//                       horizontal: 15,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'কোম্পানি সমূহ ',
//                           // 'Companies',
//                           style:
//                               Theme.of(context).textTheme.bodySmall!.copyWith(
//                                     color: Colors.grey[800],
//                                   ),
//                         ),
//                         //! CULPRIT
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               CupertinoPageRoute<ViewAllComapnies>(
//                                 builder: (context) => const ViewAllComapnies(),
//                               ),
//                             );
//                           },
//                           child: Text(
//                             'আরো দেখুন',
//                             style:
//                                 Theme.of(context).textTheme.bodySmall!.copyWith(
//                                       color: primaryColor,
//                                     ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   /// TODO: undo this
//                   const Divider(
//                     height: 4,
//                     thickness: 0.4,
//                     color: Colors.grey,
//                   ),

//                   ///! company listview
//                   /// TODO: undo this
//                   const CampanyCircularListView(),
//                   /* TextButton(
//                     onPressed: () async {
//                       if (productState is ProductComanySelect) {
//                         print('category -> ${productState.category}');
//                         print('query -> ${productState.query}');
//                         print('company -> ${productState.companyID}');
//                       } else {
//                         print('product state -> $productState');
//                       }
//                       print('button clicked :)');
//                     },
//                     child: Text('Text Queries'),
//                   ), */
//                 ],
//               ),
//             ),

//             height10,
//             Container(
//               // margin: const EdgeInsets.symmetric(
//               //   horizontal: 10,
//               // ),
//               height: 80,
//               width: MediaQuery.of(context).size.width / 1.3,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(uiBorderRadius),
//                 // color: const Color(0xffD9D9D9),
//                 // color: Colors.red,
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(uiBorderRadius),
//                 child: Image.asset(
//                   'assets/banner/3.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             height10,
//             Container(
//               margin: const EdgeInsets.symmetric(
//                 vertical: 10,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(6),
//                 border: Border.all(
//                   width: 0.6,
//                   // strokeAlign: 0.6,
//                   color: Colors.grey,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   /// Row -> Text, Text
//                   Padding(
//                     padding: const EdgeInsets.all(
//                       10,
//                       // top: 10,
//                       // left: 10,
//                       // left: 15,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'সব পণ্য',
//                           style:
//                               Theme.of(context).textTheme.bodySmall!.copyWith(
//                                     color: Colors.grey[800],
//                                   ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Divider(
//                     height: 4,
//                     thickness: 0.4,
//                     color: Colors.grey,
//                   ),

//                   const SizedBox(
//                     height: 15,
//                   ),

//                   /// product LIST GridView
//                   /// TODO: undo this
//                   const ProductGridViewWidgets(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       // child: ,
//     );
//   }
// }
