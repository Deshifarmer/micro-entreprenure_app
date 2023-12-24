import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/presentation/pages/add_group/components/group_list_with_search.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';

class GetFarmerListo extends StatefulWidget {
  const GetFarmerListo({super.key, required this.token});
  final String token;

  @override
  State<GetFarmerListo> createState() => _GetFarmerListoState();
}

class _GetFarmerListoState extends State<GetFarmerListo> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future(() {
          setState(() {});
        });
      },
      child: FutureBuilder<AllFarmerGroupFieldResp?>(
        future: DeshiFarmerAPI().getGroupFields2(widget.token),
        builder: (BuildContext context,
            AsyncSnapshot<AllFarmerGroupFieldResp?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.farmers.isEmpty) {
              debugPrint('Emptry group now showing nothing');

              return const GroupListsGrid(
                farmers: [],
              );
            }

            return GroupListsGrid(
              farmers: snapshot.data!.farmers,
            );
          } else {
            return const Center(
              child: PrimaryLoadingIndicator(),
            );
          }
        },
      ),
    );
  }
}
