import 'package:deshifarmer/data/datasources/local/corps/corps_db.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class FarmerFocusedCorpMulti extends StatelessWidget {
  const FarmerFocusedCorpMulti({
    super.key,
  });

  // final MultiSelectController _multiSelectController = MultiSelectController();
  @override
  Widget build(BuildContext context) {
    // debugPrint('multi values from state -> $_cropsList');
    // final state = context.read<AddFarmerBloc>().state;
    return BlocConsumer<AddFarmerBloc, AddFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AddFarmerInitial) {
          final newF = state.farmerFocusedCorpController.text
              .replaceAll('{', '')
              .replaceAll('}', '')
              .split(',');
          final vls = newF.map((val) {
            return ValueItem(label: val, value: null);
          }).toList();
          if (vls.length == 1 && vls.first.label.isEmpty) {
            vls.removeLast();
          }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: MultiSelectDropDown(
              // controller: _multiSelectController,
              hint: 'প্রধান ফসল নির্বাচন',
              selectedOptions: vls,
              // selectedOptions:state.farmerFocusedCorpController.text ,
              chipConfig: ChipConfig(
                wrapType: WrapType.wrap,
                backgroundColor: primaryColor,
              ),
              selectedOptionTextColor: primaryColor,
              options: cropsDatabase
                  .map((e) => ValueItem(label: e.name, value: null))
                  .toList(),
              onOptionSelected: (selectedOptions) {
                // debugPrint(
                //     'multi select controller -> ${_multiSelectController.selectedOptions}');
                final values = [];
                // debugPrint(selectedOptions);
                for (final vi in selectedOptions) {
                  // debugPrint(vi.label);
                  values.add(vi.label);
                }

                state.farmerFocusedCorpController.text =
                    values.toSet().toString();
              },
              padding: const EdgeInsets.all(8),
              dropdownHeight: MediaQuery.of(context).size.height / 2.5,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class FarmerCurrentProducingCorp extends StatelessWidget {
  const FarmerCurrentProducingCorp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // debugPrint('multi values from state -> $_cropsList');
    // final state = context.read<AddFarmerBloc>().state;
    return BlocConsumer<AddFarmerBloc, AddFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AddFarmerInitial) {
          final newF = state.farmerCurrentProducingCorpController.text
              .replaceAll('{', '')
              .replaceAll('}', '')
              .split(',');

          debugPrint('new f ${newF.length} ${newF.first}');
          final vls = newF.map(
            (val) {
              return ValueItem(label: val, value: null);
            },
          ).toList();
          if (vls.length == 1 && vls.first.label.isEmpty) {
            vls.removeLast();
          }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: MultiSelectDropDown(
              // controller: _multiSelectController,
              hint: 'বর্তমান উৎপাদনকারী ফসল নির্বাচন করুন',
              selectedOptions: vls,
              // selectedOptions:state.farmerFocusedCorpController.text ,
              chipConfig: ChipConfig(
                wrapType: WrapType.wrap,
                backgroundColor: primaryColor,
              ),
              selectedOptionTextColor: primaryColor,
              options: cropsDatabase
                  .map((e) => ValueItem(label: e.name, value: null))
                  .toList(),
              onOptionSelected: (selectedOptions) {
                // debugPrint(
                //     'multi select controller -> ${_multiSelectController.selectedOptions}');
                final values = [];
                // debugPrint(selectedOptions);
                for (final vi in selectedOptions) {
                  // debugPrint(vi.label);
                  values.add(vi.label);
                }

                state.farmerCurrentProducingCorpController.text =
                    values.toSet().toString();
              },
              padding: const EdgeInsets.all(8),
              dropdownHeight: MediaQuery.of(context).size.height / 2.5,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
