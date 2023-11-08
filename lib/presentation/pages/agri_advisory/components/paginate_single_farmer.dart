import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/entity/unit_entity.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/cubit/list_for_farmers_cubit.dart';
import 'package:deshifarmer/presentation/pages/attendance/attendance.dart';
import 'package:deshifarmer/presentation/pages/harvest/pages/harvest_record_page2.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/utils/extensions_c.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SingleFarmerSelectPaginate extends StatefulWidget {
  const SingleFarmerSelectPaginate({
    super.key,
  });

  @override
  State<SingleFarmerSelectPaginate> createState() =>
      _SingleFarmerSelectPaginateState();
}

class _SingleFarmerSelectPaginateState
    extends State<SingleFarmerSelectPaginate> {
  final PagingController<int, FarmerEntity> _pagingController =
      PagingController(firstPageKey: 1);
  late String token;
  @override
  void initState() {
    final loginState = context.read<LoginBloc>().state;
    token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    _pagingController.addPageRequestListener(_fetchPage);

    super.initState();
  }

  String? _searchTerm;
  Future<void> _fetchPage(int pageKey) async {
    try {
      final dfAPI = DeshiFarmerAPI();
      final newItems = await dfAPI.getFarmers3(
        token,
        _searchTerm,
      );

      final isLastPage = newItems?.meta?.last_page == pageKey;
      if (isLastPage && newItems?.data != null) {
        _pagingController.appendLastPage(newItems?.data ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        if (newItems?.data != null) {
          if (newItems?.data != null) {
            _pagingController.appendPage(newItems!.data, nextPageKey);
          }
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  final TextEditingController _searchController = TextEditingController();

  /// search product by name
  void _updateSearchParams(
    String searchTerm,
  ) {
    _searchTerm = searchTerm.isEmpty ? null : searchTerm;
    _pagingController.refresh();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: PrimaryLoadingIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.text,
                  onChanged: _updateSearchParams,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    // contentPadding: ,
                    filled: true,
                    hintText: 'কৃষক সার্চ করুন',
                    // filled: true,
                  ),
                ),
              ),
              Expanded(
                child: PagedListView(
                  padding: const EdgeInsets.all(10),
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate<FarmerEntity>(
                      itemBuilder: (context, FarmerEntity farmer, index) {
                    return InkWell(
                      onTap: () async {
                        context.read<ListForFarmersCubit>().addListForFarmers([
                          farmer.toGroupFarmerEntity(),
                        ]);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${farmer.image}',
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                height: getProportionateScreenHeight(50),
                                width: getProportionateScreenWidth(50),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Column(
                              children: [
                                Text(
                                  farmer.full_name ?? '',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                if (farmer.phone != null)
                                  if (farmer.phone!.isNotEmpty)
                                    Text(
                                      ' (${farmer.phone})',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                if (farmer.usaid_id != null)
                                  Text(
                                    farmer.usaid_id ?? '',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  ),
                                if (farmer.farmer_id != null)
                                  Text(
                                    ' (${farmer.farmer_id})',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          );
  }
}
