import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/group_detail_entity/farmer_entity_group.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class SelectFarmerList extends StatefulWidget {
  const SelectFarmerList({
    required this.farmers,
    super.key,
  });

  final List<FarmerEntityGroup?> farmers;

  @override
  State<SelectFarmerList> createState() => _SelectFarmerListState();
}

class _SelectFarmerListState extends State<SelectFarmerList> {
  final List<FarmerEntityGroup> _activeFarmers = [];
  bool isSelectAll = false;
  bool selectManual = true;
  bool unselectAll = false;
  @override
  Widget build(BuildContext context) {
    final agriAdvisory = context.read<AgriAdvisoryBloc>().state;
    // print('current image index -> $index');
    // final currentImage = _activeFarmers.elementAt(index);
    // if (agriAdvisory is AgriAdvisoryInitial) {
    //   // agriAdvisory.members.addAll(_activeFarmers.toSet().toList());
    //   // agriAdvisory.members.addAll(

    //   //   );
    //   // /! check if the file already exists or not
    // }
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
        // if (widget.farmers.isNotEmpty)
        //   Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Row(
        //         children: [
        //           Radio(
        //               activeColor: priceBoxColor,
        //               value: 'Farmer Group',
        //               groupValue: 'Farmer Group',
        //               onChanged: (String? val) {}),
        //           const Text(
        //             'Farmer Group',
        //             style: TextStyle(
        //               fontSize: 12,
        //             ),
        //           )
        //         ],
        //       ),
        //       Row(
        //         children: [
        //           Radio(
        //               activeColor: priceBoxColor,
        //               value: 'Single Farmer',
        //               groupValue: 'xSingle Farmer',
        //               onChanged: (String? val) {}),
        //           const Text(
        //             'Single Farmer',
        //             style: TextStyle(
        //               fontSize: 12,
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),

        if (widget.farmers.isEmpty) ...[
          const Spacer(),
          const Center(
            child: Text('No farmer in this Group'),
          ),
          const Spacer(),
        ] else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.farmers.length,
            itemBuilder: (context, index) {
              final currentFarmer = widget.farmers.elementAt(index);
              return FilterChip(
                backgroundColor: const Color(0xffd9d9d9),
                label: Text(currentFarmer?.full_name ?? ''),
                checkmarkColor: tertiaryColor,
                avatar: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
                        ? dummyImage
                        : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${currentFarmer?.image}',
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return Center(
                        child: Text(
                          'Image Error',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.redAccent,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
                side: BorderSide.none,
                onSelected: (bool isSelected) {
                  if (isSelected) {
                    if (agriAdvisory is AgriAdvisoryInitial) {
                      agriAdvisory.members.add(currentFarmer?.farmer_id ?? '');
                    }
                    _activeFarmers.add(currentFarmer!);
                  } else {
                    if (agriAdvisory is AgriAdvisoryInitial) {
                      agriAdvisory.members
                          .remove(currentFarmer?.farmer_id ?? '');
                    }
                    _activeFarmers.remove(currentFarmer);
                  }
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

        // PrimaryButtonGreen(
        //   onpress: () {
        //     Navigator.pop(context);
        //   },
        //   title: 'Done',
        // ),
      ],
    );

    // children: [
    // return Wrap(
    //   alignment: WrapAlignment.center,
    //   spacing: 10,
    //   children: [
    //     for (final s in widget.farmers)
    //       FilterChip(
    //         backgroundColor: const Color(0xffd9d9d9),
    //         label: Text(s?.full_name ?? ''),
    //         side: BorderSide.none,
    //         onSelected: (bool isSelected) {
    //           if (isSelected) {
    //             _activeFarmers.add(s!);
    //           } else {
    //             _activeFarmers.remove(s);
    //           }
    //           setState(() {});
    //         },
    //         selected: _activeFarmers.contains(s),
    //       ),
    //   ],
    // );
    //   // list of filter chip
    // ],
  }
}
