import 'package:deshifarmer/data/datasources/local/location_db/dist_db.dart';
import 'package:deshifarmer/data/datasources/local/location_db/division_db.dart';
import 'package:deshifarmer/data/datasources/local/location_db/upozilla_db.dart';
import 'package:deshifarmer/data/models/location_model.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/add_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/attendance/attendance.dart';
import 'package:flutter/material.dart';

class FarmerVillageAddress extends StatefulWidget {
  const FarmerVillageAddress({super.key});

  @override
  State<FarmerVillageAddress> createState() => _FarmerVillageAddressState();
}

class _FarmerVillageAddressState extends State<FarmerVillageAddress> {
  /// all filtered items will be stored here
  List<DistModel> filteredDist = [];
  List<UpozillaModel> filteredUpazilla = [];

  /// default values (changable)
  DivisionModel selectedDivision = divisionDatabase.first;
  DistModel selectedDist = distDatabase.first;
  UpozillaModel selectedUpazilla = upzillaDatabase.first;

  @override
  Widget build(BuildContext context) {
    final state = context.read<AddFarmerBloc>().state;
    return Column(
      children: [
        ///* division model
        Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButtonFormField<DivisionModel>(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            isExpanded: true,
            decoration: const InputDecoration(
              label: Text('বিভাগ নির্বাচন করুন'),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              filled: true,
              // fillColor: Colors.greenAccent,
              // contentPadding: EdgeInsets.all(10),
            ),
            elevation: 16,
            value: selectedDivision,
            items: divisionDatabase
                .map<DropdownMenuItem<DivisionModel>>((DivisionModel value) {
              return DropdownMenuItem<DivisionModel>(
                // alignment: Alignment.center,
                value: value,
                child: Text(value.bnName),
              );
            }).toList(),
            onChanged: (DivisionModel? val) {
              if (val != null && state is AddFarmerInitial) {
                state.farmerDivisionController.text = val.id;
              }
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
              decoration: const InputDecoration(
                label: Text('জেলা নির্বাচন করুন'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
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
                if (val != null && state is AddFarmerInitial) {
                  state.farmerDistController.text = val.id;
                }
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
              decoration: const InputDecoration(
                label: Text('উপজেলা নির্বাচন করুন'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(10),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
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

                if (val != null && state is AddFarmerInitial) {
                  state.farmerUpozillaController.text = val.id;
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
