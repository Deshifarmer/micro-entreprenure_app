import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:deshifarmer/presentation/pages/attendance/attendance.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/view/farmer_profile_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/farmer_card.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class FarmerListPage2 extends StatefulWidget {
  const FarmerListPage2({
    // required this.token,
    super.key,
  });
  // final String token;

  @override
  State<FarmerListPage2> createState() => _FarmerListPage2State();
}

class _FarmerListPage2State extends State<FarmerListPage2> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.all(8),
        //   child: Text(
        //     'আমার কৃষক তালিকা',
        //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
        //           color: primaryColor,
        //           fontWeight: FontWeight.bold,
        //         ),
        //   ),
        // ),
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
              itemBuilder: (context, farmer, index) {
                return InkWell(
                  onTap: () {
                    final loginState = context.read<LoginBloc>().state;
                    final token = loginState is LoginSuccess
                        ? loginState.successLoginEntity.token
                        : '';
                    // FarmerFetchFarmBloc
                    context.read<FarmerFetchFarmBloc>().add(
                          FramFetchEvent(
                            farmerID: farmer.farmer_id ?? '',
                            token: token,
                          ),
                        );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FarmerProfilePage(
                          farmerProfilePage: farmer,
                        ),
                      ),
                    );
                  },
                  child: FarmerCard(currentFarmer: farmer),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
