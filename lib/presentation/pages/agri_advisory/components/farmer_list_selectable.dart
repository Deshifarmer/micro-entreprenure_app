import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/group_farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/cubit/list_for_farmers_cubit.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class SelectFarmerList extends StatefulWidget {
  const SelectFarmerList({
    required this.farmers,
    super.key,
  });

  final List<GroupFarmerEntity?> farmers;

  @override
  State<SelectFarmerList> createState() => _SelectFarmerListState();
}

class _SelectFarmerListState extends State<SelectFarmerList> {
  final List<GroupFarmerEntity> _activeFarmers = [];
  bool isSelectAll = false;
  bool selectManual = true;
  bool unselectAll = false;
  @override
  Widget build(BuildContext context) {
    // final agriAdvisory = context.read<AgriAdvisoryBloc>().state;

    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Select Farmer from this List',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        if (widget.farmers.isEmpty) ...[
          // const Spacer(),
          const Center(
            child: Text('No farmer in this Group'),
          ),
          // const Spacer(),
        ] else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.farmers.length,
            itemBuilder: (context, index) {
              final currentFarmer = widget.farmers.elementAt(index);
              return FilterChip(
                backgroundColor: const Color(0xffd9d9d9),
                label: Text(
                  currentFarmer?.full_name ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                checkmarkColor: tertiaryColor,
                avatar: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: checkDomain(
                      Strings.getServerOrLocal(ServerOrLocal.server),
                    )
                        ? dummyImage
                        : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${currentFarmer?.image}',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: Colors.green[600],
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                side: BorderSide.none,
                onSelected: (bool isSelected) {
                  if (isSelected) {
                    _activeFarmers.add(currentFarmer!);
                  } else {
                    _activeFarmers.remove(currentFarmer);
                  }
                  BlocProvider.of<ListForFarmersCubit>(context)
                      .addListForFarmers(_activeFarmers);
                  setState(() {});
                },
                selected: _activeFarmers.contains(currentFarmer),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4,
              // mainAxisExtent: 10,
              mainAxisSpacing: 5,
            ),
          ),
      ],
    );
  }
}
