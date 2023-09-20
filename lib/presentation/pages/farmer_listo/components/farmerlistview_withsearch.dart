import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/view/farmer_profile_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/farmer_card.dart';
import 'package:flutter/material.dart';

class FarmerListViewWithSearch extends StatefulWidget {
  const FarmerListViewWithSearch({
    required this.allFarmerListResp,
    super.key,
  });
  final AllFarmerListResp allFarmerListResp;

  @override
  State<FarmerListViewWithSearch> createState() =>
      _FarmerListViewWithSearchState();
}

class _FarmerListViewWithSearchState extends State<FarmerListViewWithSearch> {
  List<FarmerEntity> searchResult = [];
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: TextField(
            controller: _searchController,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                searchResult = widget.allFarmerListResp.farmers
                    .where((element) =>
                        element.full_name!
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        element.phone!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                    .toList();
              });
            },
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
              hintText: 'কৃষকের নাম্বার দিয়ে সার্চ করুন',
              // filled: true,
            ),
          ),
        ),
        if (_searchController.text.isNotEmpty && searchResult.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                final currentFarmer = searchResult.elementAt(index);
                return InkWell(
                  onTap: () {
                    final loginState = context.read<LoginBloc>().state;
                    final token = loginState is LoginSuccess
                        ? loginState.successLoginEntity.token
                        : '';
                    // FarmerFetchFarmBloc
                    context.read<FarmerFetchFarmBloc>().add(FramFetchEvent(
                          farmerID: currentFarmer.farmer_id ?? '',
                          token: token,
                        ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FarmerProfilePage(
                          farmerProfilePage: currentFarmer,
                        ),
                      ),
                    );
                  },
                  child: FarmerCard(currentFarmer: currentFarmer),
                );
                // return state.allFarmerListResp.farmers
              },
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.allFarmerListResp.farmers.length,
              itemBuilder: (context, index) {
                final currentFarmer =
                    widget.allFarmerListResp.farmers.elementAt(index);
                return InkWell(
                  onTap: () {
                    final loginState = context.read<LoginBloc>().state;
                    final token = loginState is LoginSuccess
                        ? loginState.successLoginEntity.token
                        : '';
                    // FarmerFetchFarmBloc
                    context.read<FarmerFetchFarmBloc>().add(FramFetchEvent(
                          farmerID: currentFarmer.farmer_id ?? '',
                          token: token,
                        ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FarmerProfilePage(
                          farmerProfilePage: currentFarmer,
                        ),
                      ),
                    );
                  },
                  child: FarmerCard(currentFarmer: currentFarmer),
                );
                // return state.allFarmerListResp.farmers
              },
            ),
          ),
      ],
    );
  }
}
