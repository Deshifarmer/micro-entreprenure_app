import 'package:deshifarmer/data/datasources/local/location_db/dist_db.dart';
import 'package:deshifarmer/data/datasources/local/location_db/division_db.dart';
import 'package:deshifarmer/data/datasources/local/location_db/upozilla_db.dart';
import 'package:deshifarmer/data/models/location_model.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class FarmerVillageAddressForHarvest extends StatefulWidget {
  const FarmerVillageAddressForHarvest({
    required this.farmerDivisionController,
    super.key,
  });
  final TextEditingController farmerDivisionController;

  @override
  State<FarmerVillageAddressForHarvest> createState() =>
      _FarmerVillageAddressForHarvestState();
}

class _FarmerVillageAddressForHarvestState
    extends State<FarmerVillageAddressForHarvest> {
  /// all filtered items will be stored here
  List<DistModel> filteredDist = [];
  List<UpozillaModel> filteredUpazilla = [];

  /// default values (changable)
  DivisionModel selectedDivision = divisionDatabase.first;
  DistModel selectedDist = distDatabase.first;
  UpozillaModel selectedUpazilla = upzillaDatabase.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///* division model
        Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButtonFormField<DivisionModel>(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            isExpanded: true,
            decoration: InputDecoration(
              label: const Text('বিভাগ নির্বাচন করুন'),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                // borderSide: BorderSide.none,

                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                ),
                // borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                // borderSide: BorderSide.none,
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              fillColor: backgroundColor2,
              filled: true,
              // fillColor: Colors.greenAccent,
              // contentPadding: EdgeInsets.all(10),
            ),
            elevation: 16,
            value: selectedDivision,
            items: divisionDatabase
                .map<DropdownMenuItem<DivisionModel>>((DivisionModel value) {
              return DropdownMenuItem<DivisionModel>(
                value: value,
                child: Text(value.bnName),
              );
            }).toList(),
            onChanged: (DivisionModel? val) {
              setState(() {
                /// remove all items from the list
                filteredDist
                  ..clear()

                  /// add first item to the list
                  ..insert(0, distDatabase.first)

                  /// filter dist by division id
                  ..addAll(
                    distDatabase
                        .where(
                          (element) => element.divisionID == val?.id,
                        )
                        .toList(),
                  );
                selectedDivision = val ?? divisionDatabase.first;

                /// if division is changed then dist will be changed
                selectedDist = filteredDist.first;
              });

              debugPrint(
                'division: ${selectedDivision.id} dist: ${filteredDist.length}',
              );
              // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
            },
          ),
        ),

        ///* dist model
        if (selectedDivision != divisionDatabase.first)
          //   Text(selectedDist.bnName),
          //   Text(
          //     'division: ${selectedDivision.name} dist: ${selectedDist.bnName} upazilla: ${selectedUpazilla.bnName}',
          //   )
          // ],
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField<DistModel>(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              isExpanded: true,
              decoration: InputDecoration(
                label: const Text('জেলা নির্বাচন করুন'),
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
                contentPadding: const EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                fillColor: backgroundColor2,
                filled: true,
              ),
              // decoration: ShapeDecoration(),

              elevation: 16,
              value: selectedDist,

              /// items will be filtered by division id
              items: filteredDist
                  .map<DropdownMenuItem<DistModel>>((DistModel value) {
                return DropdownMenuItem<DistModel>(
                  // alignment: Alignment.center,
                  value: value,
                  child: Text(value.bnName),
                );
              }).toList(),
              onChanged: (DistModel? val) {
                setState(() {
                  /// remove all items from the list
                  filteredUpazilla
                    ..clear()
                    ..insert(0, upzillaDatabase.first)

                    /// filter upazilla by dist id
                    ..addAll(
                      upzillaDatabase
                          .where(
                            (element) => element.districtID == val?.id,
                          )
                          .toList(),
                    );

                  selectedDist = val ?? distDatabase.first;

                  /// if dist is changed then upazilla will be changed
                  selectedUpazilla = filteredUpazilla.first;
                });

                debugPrint(
                  'dist: ${selectedDist.id} upazilla: ${filteredUpazilla.length}',
                );
                // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
              },
            ),
          ),

        ///* upazila model
        if (selectedDist != distDatabase.first)
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField<UpozillaModel>(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              isExpanded: true,
              decoration: InputDecoration(
                label: const Text('উপজেলা নির্বাচন করুন'),
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
                contentPadding: const EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                fillColor: backgroundColor2,
                filled: true,
                // fillColor: Colors.greenAccent,
                // contentPadding: EdgeInsets.all(10),
              ),
              // decoration: ShapeDecoration(),

              elevation: 16,
              value: selectedUpazilla,

              /// items will be filtered by dist id
              items: filteredUpazilla
                  .map<DropdownMenuItem<UpozillaModel>>((UpozillaModel value) {
                return DropdownMenuItem<UpozillaModel>(
                  // alignment: Alignment.center,
                  value: value,
                  child: Text(value.bnName),
                );
              }).toList(),
              onChanged: (UpozillaModel? val) {
                // context.read<DropdownCubit>().changeDropdownValue(val ?? '');

                if (val != null) {
                  widget.farmerDivisionController.text = val.id;
                }
                setState(() {
                  selectedUpazilla = val ?? upzillaDatabase.first;
                });
                debugPrint('upazilla: ${selectedUpazilla.id} ');
              },
            ),
          ),
      ],
    );
  }
}
