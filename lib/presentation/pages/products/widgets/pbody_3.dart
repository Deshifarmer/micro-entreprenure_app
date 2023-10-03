import 'package:deshifarmer/data/datasources/remote/apis/products_api.dart';
import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/company_card_view.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_card.dart';
import 'package:deshifarmer/presentation/pages/products/pages/view_companies.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// {@template products_body}
/// Body of the ProductsPage.
///
/// Add what it does
/// {@endtemplate}
class ProductsBody3 extends StatefulWidget {
  /// {@macro products_body}
  const ProductsBody3({
    required this.token,
    super.key,
  });

  final String token;

  @override
  State<ProductsBody3> createState() => _ProductsBody3State();
}

class _ProductsBody3State extends State<ProductsBody3> {
  final PagingController<int, ProductData> _pagingController =
      PagingController(firstPageKey: 1);
  String? _searchTerm;
  String? _cat;
  String? _company;
  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  String companySelect = '';

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ProductFetchAPI().getProductSearch(
        widget.token,
        _company,
        _cat,
        _searchTerm,
      );

      final isLastPage = newItems?.meta?.last_page == pageKey;
      if (isLastPage && newItems?.data != null) {
        _pagingController.appendLastPage(newItems?.data! ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        if (newItems?.data != null) {
          if (newItems?.data != null) {
            _pagingController.appendPage(newItems!.data!, nextPageKey);
          }
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  /// search product by name
  void _updateSearchParams(String searchTerm, String cat, String company) {
    _searchTerm = searchTerm;
    _cat = cat;
    _company = company;
    _pagingController.refresh();
  }

  final ScrollController customController = ScrollController();
  final ScrollController pagingController = ScrollController();
  final TextEditingController productSearchController = TextEditingController();
  bool isTheEnd = false;
  @override
  Widget build(BuildContext context) {
    // final productState = context.read<ProductsBloc>().state;
    final categoryState = context.read<CategoryBloc>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: CustomScrollView(
        cacheExtent: 100,
        shrinkWrap: true,
        // if scrollcontroller reached then the end is true
        controller: customController
          ..addListener(
            () {
              if (customController.position.atEdge) {
                // print(
                //     'scroll controller -> ${customController.position.pixels}');
                if (customController.position.pixels != 0) {
                  setState(() {
                    isTheEnd = true;
                  });
                } else {
                  setState(() {
                    isTheEnd = false;
                  });
                }
              } else {
                setState(() {
                  isTheEnd = false;
                });
              }
            },
          ),
        slivers: [
          ///! Search, Companies and Banner
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: getProportionateScreenHeight(200),
            toolbarHeight: 0,
            bottom: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width / 1,
                getProportionateScreenHeight(310),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///! Search field and category
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            top: 10,
                            right: 10,
                          ),

                          ///! PERF: Searching Text Field
                          child: TextField(
                            controller: productSearchController,
                            onChanged: (value) {
                              _updateSearchParams(
                                value,
                                _cat ?? '',
                                _company ?? '',
                              );
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.circular(uiBorderRadius),
                              ),
                              // focusedErrorBorder: OutlineInputBorder(),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xff757575),
                              ),
                              hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
                              filled: true,
                              fillColor: Colors.white70,
                              hintStyle: const TextStyle(
                                color: Color(0xff6a6a6a),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (categoryState is CategorySuccess)

                        ///! PERF: categories
                        PopupMenuButton<CategoryEntity>(
                          padding: EdgeInsets.zero,
                          // surfaceTintColor: primaryColor,
                          onSelected: (CategoryEntity value) {
                            // print('cat -> ${value.title} ${value.id}');
                            // _updateCat(value.id.toString());
                            _updateSearchParams(
                              _searchTerm ?? '',
                              value.id.toString(),
                              _company ?? '',
                            );
                          },
                          enableFeedback: true,
                          surfaceTintColor: backgroundColor2,
                          itemBuilder: (BuildContext context) =>
                              categoryState.allCategoryListResp.category
                                  .map(
                                    (CategoryEntity e) =>
                                        PopupMenuItem<CategoryEntity>(
                                      value: e,
                                      child: Text(e.title.split('-').last),
                                    ),
                                  )
                                  .toList(),
                          color: backgroundColor2,
                          icon: Container(
                            // margin: EdgeInsets.all(0),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                width: 0.6,
                                // strokeAlign: 0.6,
                                color: Colors.grey,
                              ),
                            ),
                            child: const Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),

                  ///! company list
                  Container(
                    // margin: const EdgeInsets.all(10),
                    // color: backgroundColor2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.6,
                        // strokeAlign: 0.6,
                        color: Colors.grey,
                      ),
                    ),
                    margin: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    // elevation: 1,
                    // margin: const EdgeInsets.only(
                    //   bottom: 20,
                    // ),
                    height: 140,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'কোম্পানি সমূহ ',
                                // 'Companies',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: Colors.grey[800],
                                    ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute<ViewAllComapnies>(
                                      builder: (context) =>
                                          const ViewAllComapnies(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'আরো দেখুন',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: primaryColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 4,
                          thickness: 0.4,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: BlocConsumer<CompanyBloc, CompanyState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              if (state is CompanySuccess) {
                                final allCompany = state.allCompanyListResp;
                                print(
                                  'company length -> ${allCompany.allCompany.length}',
                                );
                                return ListView.builder(
                                  shrinkWrap: true,
                                  // reverse: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: allCompany.allCompany.length,
                                  itemBuilder: (context, index) {
                                    final currentCompany =
                                        allCompany.allCompany.elementAt(index);
                                    print('$index ${currentCompany.full_name}');
                                    // final companyState = context.read<ProductsBloc>().state;
                                    // print('${Strings.domain}/storage${currentCompany.photo}');
                                    return BlocConsumer<ProductsBloc,
                                        ProductsState>(
                                      listener: (context, companyState) {
                                        print(
                                          'company states -> $companyState',
                                        );
                                      },
                                      builder: (context, companyState) {
                                        return InkWell(
                                          onTap: () {
                                            final loginState =
                                                context.read<LoginBloc>().state;
                                            final token =
                                                loginState is LoginSuccess
                                                    ? loginState
                                                        .successLoginEntity
                                                        .token
                                                    : '';
                                            if (companySelect ==
                                                currentCompany.df_id) {
                                              setState(() {
                                                companySelect = '';
                                              });
                                              _updateSearchParams(
                                                _searchTerm ?? '',
                                                _cat ?? '',
                                                '',
                                              );
                                            } else {
                                              setState(() {
                                                companySelect =
                                                    currentCompany.df_id ?? '';
                                              });
                                              _updateSearchParams(
                                                _searchTerm ?? '',
                                                _cat ?? '',
                                                currentCompany.df_id ?? '',
                                              );
                                            }
                                            // if (companyState
                                            //     is ProductComanySelect) {
                                            //   if (currentCompany.df_id ==
                                            //       companyState.companyID) {
                                            //     _updateSearchParams(
                                            //       _searchTerm ?? '',
                                            //       _cat ?? '',
                                            //       '',
                                            //     );
                                            //     context.read<ProductsBloc>().add(
                                            //         const UnSelectCompanyEvent());
                                            //   } else {
                                            //     _updateSearchParams(
                                            //       _searchTerm ?? '',
                                            //       _cat ?? '',
                                            //       currentCompany.df_id ?? '',
                                            //     );
                                            //     context
                                            //         .read<ProductsBloc>()
                                            //         .add(
                                            //           SelectCompanysEvent(
                                            //             currentCompany.df_id ??
                                            //                 '',
                                            //           ),
                                            //         );
                                            //   }
                                            // } else {
                                            //   context.read<ProductsBloc>().add(
                                            //         SelectCompanysEvent(
                                            //             currentCompany.df_id ??
                                            //                 ''),
                                            //       );
                                            // }
                                          },
                                          child: Tooltip(
                                            message:
                                                currentCompany.full_name ?? '',
                                            decoration: BoxDecoration(
                                              color: Colors.green[400]!
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Container(
                                              margin: const EdgeInsets.all(5),
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: companySelect.isNotEmpty
                                                    ? currentCompany.df_id ==
                                                            companySelect
                                                        ? Colors.green[400]!
                                                            .withOpacity(0.4)
                                                        : null
                                                    : null,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                              ),
                                              child: CompanyCardView(
                                                  currentCompany:
                                                      currentCompany),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green[600],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///! BANNer
                  Container(
                    // margin: const EdgeInsets.symmetric(
                    //   horizontal: 10,
                    // ),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(uiBorderRadius),
                      // color: const Color(0xffD9D9D9),
                      // color: Colors.red,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(uiBorderRadius),
                      child: Image.asset(
                        'assets/banner/3.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ///! ONLY THE PRODUCT
          SliverFillRemaining(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 0.6,
                  // strokeAlign: 0.6,
                  color: Colors.grey,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                      // top: 10,
                      // left: 10,
                      // left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'সব পণ্য',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey[800],
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 4,
                    thickness: 0.4,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: PagedGridView<int, ProductData>(
                      // scrollController: pagingController
                      //   ..addListener(() {
                      //     // if the scroll controller reached the start then the end is false
                      //     // if (pagingController.position.atEdge) {
                      //     //   if (pagingController.position.pixels != 0) {
                      //     //     print('reached the first of list');
                      //     //     setState(() {
                      //     //       isTheEnd = true;
                      //     //     });
                      //     //   } else {
                      //     //     setState(() {
                      //     //       isTheEnd = false;
                      //     //     });
                      //     //   }
                      //     // } else {
                      //     //   setState(() {
                      //     //     isTheEnd = false;
                      //     //   });
                      //     // }
                      //   }),
                      physics: isTheEnd
                          ? const BouncingScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3.5,
                      ),
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate<ProductData>(
                        animateTransitions: true,
                        itemBuilder: (context, item, index) => ProductCard(
                          product: item,
                        ),
                        // itemBuilder: (context, item, index) => Text(item.name ?? ''),
                      ),
                      // separatorBuilder: (context, index) => const Divider(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
