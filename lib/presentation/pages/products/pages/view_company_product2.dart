import 'package:deshifarmer/data/datasources/remote/apis/products_api.dart';
import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_card.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ViewCompanyProducts2 extends StatefulWidget {
  const ViewCompanyProducts2({
    required this.token,
    required this.companyID,
    required this.companyName,
    super.key,
  });
  final String token;
  final String companyName;
  final String companyID;

  @override
  State<ViewCompanyProducts2> createState() => _ViewCompanyProducts2State();
}

class _ViewCompanyProducts2State extends State<ViewCompanyProducts2> {
  final PagingController<int, ProductData> _pagingController =
      PagingController(firstPageKey: 1);
  String? _searchTerm;
  String? _cat;
  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ProductFetchAPI().getProductSearch(
        widget.token,
        widget.companyID,
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

  // search product by name
  void _updateSearchTerm(String searchTerm) {
    _searchTerm = searchTerm;
    _pagingController.refresh();
  }

  // search product by name
  void _updateCat(String searchTerm) {
    _cat = searchTerm;
    _pagingController.refresh();
  }

  @override
  Widget build(BuildContext context) {
    final categoryState = context.read<CategoryBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.companyName),
        surfaceTintColor: backgroundColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
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
                      onChanged: _updateSearchTerm,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(uiBorderRadius),
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
                      _updateCat(value.id.toString());
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
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => Future.sync(
                  _pagingController.refresh,
                ),
                child: PagedGridView<int, ProductData>(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3.5,
                    // mainAxisSpacing: 10,
                    // crossAxisSpacing: 10,
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
