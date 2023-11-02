import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/services/blocs/my_farmer/my_farmer_bloc.dart';
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
  // String? selectedValue;

  // final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyFarmerSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  'কৃষক নির্বাচন করুন',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: DropdownButtonFormField<FarmerEntity>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    fillColor: backgroundColor2,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    hintText: '',
                    filled: true,
                  ),
                  hint: Text(
                    'Select Farmer',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  items: state.allFarmerListResp.farmers
                      .toSet()
                      .toList()
                      .map<DropdownMenuItem<FarmerEntity>>(
                          (FarmerEntity value) {
                    return DropdownMenuItem<FarmerEntity>(
                      alignment: Alignment.center,
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                  validator: (value) {
                    if (value == null) {
                      return 'Please select Farmer';
                    }
                    return null;
                  },
                  onChanged: (FarmerEntity? val) {
                    if (val != null) {
                      widget.selectFarmerController!.text = val.farmer_id ?? '';
                    }
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
