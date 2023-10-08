import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SelectFarmerMethodsForHarvest extends StatefulWidget {
  const SelectFarmerMethodsForHarvest({
    required this.selectFarmerController,
    super.key,
  });
  final TextEditingController? selectFarmerController;

  @override
  State<SelectFarmerMethodsForHarvest> createState() =>
      _SelectFarmerMethodsForHarvestState();
}

class _SelectFarmerMethodsForHarvestState
    extends State<SelectFarmerMethodsForHarvest> {
  String? selectedValue;

  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyFarmerSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<FarmerEntity>(
                isExpanded: true,
                hint: Text(
                  'Select Farmer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                // itemHeight: 300,
                // menuMaxHeight: 200,
                dropdownSearchData: DropdownSearchData(
                  searchController: textEditingController,
                  searchInnerWidgetHeight: 50,
                  searchInnerWidget: Container(
                    height: 50,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: widget.selectFarmerController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Search for farmer....',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.full_name
                        .toString()
                        .contains(searchValue);
                  },
                ),
                value: state.allFarmerListResp.farmers.first,
                items: state.allFarmerListResp.farmers
                    .map<DropdownMenuItem<FarmerEntity>>((value) {
                  return DropdownMenuItem<FarmerEntity>(
                    alignment: Alignment.center,
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              height: 50,
                              width: 50,
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Text(
                            value.full_name ?? '',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          if (value.phone != null)
                            if (value.phone!.isNotEmpty)
                              Text(
                                ' (${value.phone})',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (FarmerEntity? val) {
                  if (val != null) {
                    widget.selectFarmerController!.text = val.farmer_id ?? '';
                  }
                },
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
