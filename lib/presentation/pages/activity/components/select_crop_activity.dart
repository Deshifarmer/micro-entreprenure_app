import 'package:deshifarmer/data/datasources/local/corps/corps_db.dart';
import 'package:deshifarmer/presentation/blocs/record_sowing/record_sowing_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class SelectCropOptional extends StatelessWidget {
  const SelectCropOptional({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // debugPrint('multi values from state -> $_cropsList');
    // final state = context.read<AddFarmerBloc>().state;
    return BlocConsumer<RecordSowingBloc, RecordSowingState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is RecordSowingInitial) {
          final newF = state.crop.text
              .replaceAll('{', '')
              .replaceAll('}', '')
              .split(',');

          debugPrint('new f ${newF.length} ${newF.first}');
          final vls = newF.map(
            (val) {
              return ValueItem(label: val);
            },
          ).toList();
          if (vls.length == 1 && vls.first.label.isEmpty) {
            vls.removeLast();
          }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: MultiSelectDropDown(
              // controller: _multiSelectController,
              selectedOptions: vls,
              // selectedOptions:state.farmerFocusedCorpController.text ,
              backgroundColor: backgroundColor2,
              optionsBackgroundColor: backgroundColor2,
              chipConfig: const ChipConfig(
                wrapType: WrapType.wrap,
                backgroundColor: primaryColor,
              ),
              selectedOptionTextColor: primaryColor,
              options:
                  cropsDatabase.map((e) => ValueItem(label: e.name)).toList(),
              onOptionSelected: (selectedOptions) {
                // debugPrint(
                //     'multi select controller -> ${_multiSelectController.selectedOptions}');
                final values = [];
                // debugPrint(selectedOptions);
                for (final vi in selectedOptions) {
                  values.add(vi.label);
                }
                state.crop.text = values.toSet().toString();
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
