// import 'package:deshifarmer/data/datasources/remote/apis/products_api.dart';
// import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
// import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
// import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
// import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
// import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
// import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
// import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
// import 'package:deshifarmer/presentation/pages/products/components/cart_btn_components.dart';
// import 'package:deshifarmer/presentation/pages/products/components/category_menu_items.dart';
// import 'package:deshifarmer/presentation/pages/products/components/company_c_list_view.dart';
// import 'package:deshifarmer/presentation/pages/products/components/company_card_view.dart';
// import 'package:deshifarmer/presentation/pages/products/components/product_card.dart';
// import 'package:deshifarmer/presentation/pages/products/pages/view_companies.dart';
// import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
// import 'package:deshifarmer/presentation/widgets/constraints.dart';
// import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// /// {@template products_body}
// /// Body of the ProductsPage.
// ///
// /// Add what it does
// /// {@endtemplate}
// class ProductsBody3 extends StatefulWidget {
//   /// {@macro products_body}
//   const ProductsBody3({
//     required this.token,
//     super.key,
//   });

//   final String token;

//   @override
//   State<ProductsBody3> createState() => _ProductsBody3State();
// }

// class _ProductsBody3State extends State<ProductsBody3> {
//   final PagingController<int, ProductData> _pagingController =
//       PagingController(firstPageKey: 1);
//   String? _searchTerm;
//   String? _cat;
//   String? _company;
//   @override
//   void initState() {
//     _pagingController.addPageRequestListener(_fetchPage);
//     super.initState();
//   }

//   Future<void> _fetchPage(int pageKey) async {
//     try {
//       final newItems = await ProductFetchAPI().getProductSearch(
//         widget.token,
//         _company,
//         _cat,
//         _searchTerm,
//       );

//       final isLastPage = newItems?.meta?.last_page == pageKey;
//       if (isLastPage && newItems?.data != null) {
//         _pagingController.appendLastPage(newItems?.data! ?? []);
//       } else {
//         final nextPageKey = pageKey + 1;
//         if (newItems?.data != null) {
//           if (newItems?.data != null) {
//             _pagingController.appendPage(newItems!.data!, nextPageKey);
//           }
//         }
//       }
//     } catch (error) {
//       _pagingController.error = error;
//     }
//   }

//   /// search product by name
//   void _updateSearchParams(String searchTerm, String cat, String company) {
//     _searchTerm = searchTerm;
//     _cat = cat;
//     _company = company;
//     _pagingController.refresh();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final productState = context.read<ProductsBloc>().state;
//     final categoryState = context.read<CategoryBloc>().state;
//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//       ),
//       child: Column(
//         children: [
//           Container(
//             // color: backgroundColor2,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(6),
//               border: Border.all(
//                 width: 0.6,
//                 // strokeAlign: 0.6,
//                 color: Colors.grey,
//               ),
//             ),
//             margin: const EdgeInsets.only(
//               bottom: 10,
//             ),
//             // elevation: 1,
//             // margin: const EdgeInsets.only(
//             //   bottom: 20,
//             // ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //       child: Padding(
//                 //         padding: const EdgeInsets.only(
//                 //           bottom: 10,
//                 //           top: 10,
//                 //           right: 10,
//                 //         ),

//                 //         ///! PERF: Searching Text Field
//                 //         child: TextField(
//                 //           onChanged: (value) {
//                 //             _updateSearchParams(
//                 //               value,
//                 //               _cat ?? '',
//                 //               _company ?? '',
//                 //             );
//                 //           },
//                 //           decoration: InputDecoration(
//                 //             contentPadding: const EdgeInsets.all(8),
//                 //             enabledBorder: OutlineInputBorder(
//                 //               borderSide: BorderSide.none,
//                 //               borderRadius:
//                 //                   BorderRadius.circular(uiBorderRadius),
//                 //             ),
//                 //             // focusedErrorBorder: OutlineInputBorder(),
//                 //             border: const OutlineInputBorder(
//                 //               borderSide: BorderSide.none,
//                 //             ),
//                 //             prefixIcon: const Icon(
//                 //               Icons.search,
//                 //               color: Color(0xff757575),
//                 //             ),
//                 //             hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
//                 //             filled: true,
//                 //             fillColor: Colors.white70,
//                 //             hintStyle: const TextStyle(
//                 //               color: Color(0xff6a6a6a),
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //     if (categoryState is CategorySuccess)

//                 //       ///! PERF: categories
//                 //       PopupMenuButton<CategoryEntity>(
//                 //         padding: EdgeInsets.zero,
//                 //         // surfaceTintColor: primaryColor,
//                 //         onSelected: (CategoryEntity value) {
//                 //           // debugPrint('cat -> ${value.title} ${value.id}');
//                 //           // _updateCat(value.id.toString());
//                 //         },
//                 //         enableFeedback: true,
//                 //         surfaceTintColor: backgroundColor2,
//                 //         itemBuilder: (BuildContext context) =>
//                 //             categoryState.allCategoryListResp.category
//                 //                 .map(
//                 //                   (CategoryEntity e) =>
//                 //                       PopupMenuItem<CategoryEntity>(
//                 //                     value: e,
//                 //                     child: Text(e.title.split('-').last),
//                 //                   ),
//                 //                 )
//                 //                 .toList(),
//                 //         color: backgroundColor2,
//                 //         icon: Container(
//                 //           // margin: EdgeInsets.all(0),
//                 //           padding: const EdgeInsets.symmetric(
//                 //             vertical: 10,
//                 //             horizontal: 10,
//                 //           ),
//                 //           decoration: BoxDecoration(
//                 //             borderRadius: BorderRadius.circular(6),
//                 //             border: Border.all(
//                 //               width: 0.6,
//                 //               // strokeAlign: 0.6,
//                 //               color: Colors.grey,
//                 //             ),
//                 //           ),
//                 //           child: const Icon(
//                 //             Icons.menu,
//                 //             color: Colors.black,
//                 //           ),
//                 //         ),
//                 //       ),
//                 //   ],
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 10,
//                     horizontal: 15,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'কোম্পানি সমূহ ',
//                         // 'Companies',
//                         style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                               color: Colors.grey[800],
//                             ),
//                       ),
//                       //! CULPRIT
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             CupertinoPageRoute<ViewAllComapnies>(
//                               builder: (context) => const ViewAllComapnies(),
//                             ),
//                           );
//                         },
//                         child: Text(
//                           'আরো দেখুন',
//                           style:
//                               Theme.of(context).textTheme.bodySmall!.copyWith(
//                                     color: primaryColor,
//                                   ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const Divider(
//                   height: 4,
//                   thickness: 0.4,
//                   color: Colors.grey,
//                 ),

//                 ///! company listview
//                 // const CampanyCircularListView(),
//                 Container(
//                   margin: const EdgeInsets.all(10),
//                   height: 100,
//                   child: BlocConsumer<CompanyBloc, CompanyState>(
//                     listener: (context, state) {},
//                     builder: (context, state) {
//                       if (state is CompanySuccess) {
//                         final allCompany = state.allCompanyListResp;
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           reverse: true,
//                           scrollDirection: Axis.horizontal,
//                           itemCount: allCompany.allCompany.length,
//                           itemBuilder: (context, index) {
//                             final currentCompany =
//                                 allCompany.allCompany.elementAt(index);
//                             // final companyState = context.read<ProductsBloc>().state;
//                             // debugPrint('${Strings.domain}/storage${currentCompany.photo}');
//                             return BlocConsumer<ProductsBloc, ProductsState>(
//                               listener: (context, companyState) {
//                                 debugPrint('company states -> $companyState');
//                               },
//                               builder: (context, companyState) {
//                                 return InkWell(
//                                   onTap: () {
//                                     final loginState =
//                                         context.read<LoginBloc>().state;
//                                     final token = loginState is LoginSuccess
//                                         ? loginState.successLoginEntity.token
//                                         : '';
//                                     if (companyState is ProductComanySelect) {
//                                       if (currentCompany.df_id ==
//                                           companyState.companyID) {
//                                         context
//                                             .read<ProductsBloc>()
//                                             .add(const UnSelectCompanyEvent());

//                                         _updateSearchParams(
//                                           _searchTerm ?? '',
//                                           _cat ?? '',
//                                           '',
//                                         );
//                                       } else {
//                                         context.read<ProductsBloc>().add(
//                                               SelectCompanysEvent(
//                                                 currentCompany.df_id ?? '',
//                                               ),
//                                             );

//                                         _updateSearchParams(
//                                           _searchTerm ?? '',
//                                           _cat ?? '',
//                                           currentCompany.df_id ?? '',
//                                         );
//                                       }
//                                     } else {
//                                       context.read<ProductsBloc>().add(
//                                             SelectCompanysEvent(
//                                                 currentCompany.df_id ?? ''),
//                                           );
//                                     }
//                                   },
//                                   child: Tooltip(
//                                     message: currentCompany.full_name ?? '',
//                                     decoration: BoxDecoration(
//                                       color:
//                                           Colors.green[400]!.withOpacity(0.4),
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(10)),
//                                     ),
//                                     child: Container(
//                                       margin: const EdgeInsets.all(5),
//                                       padding: const EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                         color:
//                                             companyState is ProductComanySelect
//                                                 ? currentCompany.df_id ==
//                                                         companyState.companyID
//                                                     ? Colors.green[400]!
//                                                         .withOpacity(0.4)
//                                                     : null
//                                                 : null,
//                                         borderRadius: const BorderRadius.all(
//                                             Radius.circular(10)),
//                                       ),
//                                       child: CompanyCardView(
//                                           currentCompany: currentCompany),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         );
//                       }
//                       return Center(
//                         child: CircularProgressIndicator(
//                           color: Colors.green[600],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           height10,
//           Container(
//             // margin: const EdgeInsets.symmetric(
//             //   horizontal: 10,
//             // ),
//             height: 80,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(uiBorderRadius),
//               // color: const Color(0xffD9D9D9),
//               // color: Colors.red,
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(uiBorderRadius),
//               child: Image.asset(
//                 'assets/banner/3.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           height10,
//           Expanded(
//             child: Container(
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

//                   Expanded(
//                     child: PagedGridView<int, ProductData>(
//                       // physics: const NeverScrollableScrollPhysics(),
//                       // shrinkWrap: true,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 2 / 3.5,
//                         // mainAxisSpacing: 10,
//                         // crossAxisSpacing: 10,
//                       ),
//                       pagingController: _pagingController,
//                       builderDelegate: PagedChildBuilderDelegate<ProductData>(
//                         animateTransitions: true,
//                         itemBuilder: (context, item, index) => ProductCard(
//                           product: item,
//                         ),
//                         // itemBuilder: (context, item, index) => Text(item.name ?? ''),
//                       ),
//                       // separatorBuilder: (context, index) => const Divider(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),

//       // child: ,
//     );
//   }
// }
// /*

//     /// TextField
         

         
//           */