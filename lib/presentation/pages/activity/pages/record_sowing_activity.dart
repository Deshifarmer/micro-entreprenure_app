import 'package:deshifarmer/domain/entities/krishibebsa_pro/prod_entity.dart';
import 'package:deshifarmer/presentation/blocs/record_sowing/record_sowing_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/entity/unit_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/components/get_recorded_photo.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/components/harvest_post_api.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';

const fertilizerType = <String>[
  'Nitrogen Fertilizers',
  'Phosphorus Fertilizers',
  'Potassium Fertilizers',
  'Compound Fertilizers',
  'Manure',
  'Compost (organic)',
  'Fish Emulsion (organic)',
  'Bone Meal (organic)',
  'Biofertilizers (natural)',
  'Green Manure (natural)',
];

class RecordSowingActivity extends StatefulWidget {
  const RecordSowingActivity({
    required this.recordName,
    required this.batchID,
    required this.krishibebshaProd,
    required this.units,
    super.key,
  });

  final String recordName;
  final String batchID;
  final List<KrishibebshaProd>? krishibebshaProd;
  final List<UnitEntity> units;

  @override
  State<RecordSowingActivity> createState() => _RecordSowingActivityState();
}

class _RecordSowingActivityState extends State<RecordSowingActivity> {
  /// Date
  DateTime? _landprefDate = DateTime.now();
  final TextEditingController _landprefDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    debugPrint(
      'name -> ${widget.recordName} ${activityRecordValues[widget.recordName] == ActivityTypeEnums.landpref}',
    );

    // final recordSowingState = context.read<RecordSowingBloc>().state;
    return WillPopScope(
      onWillPop: () async {
        final recordSowingState = context.read<RecordSowingBloc>().state;
        if (recordSowingState is RecordSowingInitial) {
          debugPrint('printing shit from bloc ');
          recordSowingState.clearAll();
        }

        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor2,
        appBar: AppBar(
          surfaceTintColor: backgroundColor2,
          backgroundColor: backgroundColor2,
        ),
        body: BlocConsumer<RecordSowingBloc, RecordSowingState>(
          listener: (context, state) {
            if (state is RecordSowingSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(successSnackBar('Successfully Created Record'));
            }
            if (state is RecordSowingFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar('Failed to Created Record'));
            }
          },
          builder: (BuildContext context, RecordSowingState state) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'রেকর্ড ${widget.recordName}',
                        // child: Text('Record Sowing',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'একটি কার্যকলাপ রেকর্ড করার সময় আপনার অবস্থান স্বয়ংক্রিয়ভাবে ক্যাপচার করা হবে',
                        // 'Your location will be automatically captured while recording an activity',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    if (activityRecordValues[widget.recordName] ==
                        ActivityTypeEnums.landpref) ...[
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: RecordActivityPicUpload(),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8),
                        // child: Text('Unit'),
                        child: Text('জমি প্রস্তুতির তারিখ'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          controller: _landprefDateController,
                          onTap: () async {
                            _landprefDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1880),
                              lastDate: DateTime.now(),
                            );
                            _landprefDateController.text =
                                _landprefDate.toString().split(' ').first;
                            if (state is RecordSowingInitial) {
                              state.landPepDate.text =
                                  _landprefDate.toString().split(' ').first;
                            }
                          },
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 20,
                              horizontal: 15,
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            hintText: 'জমি প্রস্তুতির তারিখ',
                            filled: true,
                          ),
                        ),
                      ),
                    ] else if (activityRecordValues[widget.recordName] ==
                        ActivityTypeEnums.sowing) ...[
                      /// seed sourcej
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Select crop (optional)'),
                        // child: Text('Quantity'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: DropdownButtonFormField<String>(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          focusColor: backgroundColor2,
                          dropdownColor: backgroundColor2,
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            filled: true,
                            fillColor: backgroundColor2,
                            // contentPadding: EdgeInsets.all(10),
                          ),
                          // decoration: ShapeDecoration(),
                          elevation: 16,
                          hint: const Text('ফসল নির্বাচন করুন'),
                          // items: ['Deshifarmer Ltd.', 'Outside']
                          items: widget.krishibebshaProd != null
                              ? widget.krishibebshaProd!
                                  .map((e) => e.name)
                                  .toList()
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                  return DropdownMenuItem<String>(
                                    // alignment: Alignment.center,
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()
                              : [],
                          onChanged: (String? val) {
                            if (val != null) {
                              // sowingSeedsource = val;
                              if (state is RecordSowingInitial) {
                                state.sowingCrop.text = val;
                              }
                            }
                            // if (state is RecordSowingInitial) {
                            //   state.quantity.text = val.toString();
                            // }
                          },
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8),
                        // child: Text('Unit'),
                        child: Text('Seed name with company name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: state is RecordSowingInitial
                              ? state.sowingNameWithCompany
                              : null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 20,
                              horizontal: 15,
                            ),
                            filled: true,
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8),
                        // child: Text('Unit'),
                        child: Text('Seed Price'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: state is RecordSowingInitial
                              ? state.sowingSeedPrice
                              : null,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 20,
                              horizontal: 15,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                      //! quantity KG
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text('পরিমান '),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: TextField(
                                    controller: state is RecordSowingInitial
                                        ? state.sowingSeedQuantity
                                        : null,
                                    // onTap: () async {},
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      // suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                                      fillColor: backgroundColor2,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        // vertical: 20,
                                        horizontal: 15,
                                      ),
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      hintText: '',
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// another column for the type
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text('পরিমানের ধরণ'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  // child:  ,
                                  // a dropdown of units
                                  child: DropdownButtonFormField<UnitEntity>(
                                    isDense: false,
                                    // menuMaxHeight:
                                    // getProportionateScreenHeight(40),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      fillColor: backgroundColor2,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        // vertical: 5,
                                        horizontal: 3,
                                      ),
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      hintText: '',
                                      filled: true,
                                    ),
                                    // decoration: ShapeDecoration(),
                                    // itemHeight: 300,
                                    elevation: 16,
                                    value: widget.units.first,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                    ),
                                    items: widget.units
                                        .map<DropdownMenuItem<UnitEntity>>(
                                            (value) {
                                      return DropdownMenuItem<UnitEntity>(
                                        alignment: Alignment.center,
                                        value: value,
                                        child: ListTile(
                                          title: Text(value.unit),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (UnitEntity? val) {
                                      // print('on pressed called');
                                      if (val != null) {
                                        if (state is RecordSowingInitial) {
                                          state.sowingSeedUnit.text = val.unit;
                                        }
                                        // unitController.text = val;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ] else if (activityRecordValues[widget.recordName] ==
                        ActivityTypeEnums.fertilizer) ...[
                      /// seed sourcej
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Fertilizer type'),
                        // child: Text('Quantity'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: DropdownButtonFormField<String>(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          focusColor: backgroundColor2,
                          dropdownColor: backgroundColor2,
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            filled: true,
                            fillColor: backgroundColor2,
                            // contentPadding: EdgeInsets.all(10),
                          ),
                          // decoration: ShapeDecoration(),
                          elevation: 16,
                          hint: const Text('ফসল নির্বাচন করুন'),
                          items: fertilizerType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              // alignment: Alignment.center,
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            if (val != null) {
                              if (state is RecordSowingInitial) {
                                state.fertilizerType.text = val;
                              }
                            }
                          },
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8),
                        // child: Text('Unit'),
                        child: Text('Fertilizer name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: state is RecordSowingInitial
                              ? state.fertilizerName
                              : null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 20,
                              horizontal: 15,
                            ),
                            filled: true,
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8),
                        // child: Text('Unit'),
                        child: Text('Amount'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: state is RecordSowingInitial
                              ? state.fertilizerAmount
                              : null,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 20,
                              horizontal: 15,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                    ] else if (activityRecordValues[widget.recordName] ==
                        ActivityTypeEnums.pesticide) ...[
                      /// seed sourcej
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Fertilizer type'),
                        // child: Text('Quantity'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: DropdownButtonFormField<String>(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          focusColor: backgroundColor2,
                          dropdownColor: backgroundColor2,
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            filled: true,
                            fillColor: backgroundColor2,
                            // contentPadding: EdgeInsets.all(10),
                          ),
                          // decoration: ShapeDecoration(),
                          elevation: 16,
                          hint: const Text('ফসল নির্বাচন করুন'),
                          items: fertilizerType
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              // alignment: Alignment.center,
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            if (val != null) {
                              if (state is RecordSowingInitial) {
                                state.pesticideType.text = val;
                              }
                            }
                          },
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8),
                        // child: Text('Unit'),
                        child: Text('Fertilizer name'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: state is RecordSowingInitial
                              ? state.pesticideName
                              : null,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 20,
                              horizontal: 15,
                            ),
                            filled: true,
                          ),
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8),
                        // child: Text('Unit'),
                        child: Text('Amount'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          controller: state is RecordSowingInitial
                              ? state.pesticideAmount
                              : null,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 20,
                              horizontal: 15,
                            ),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('কার্যকলাপ বিবরণ'),
                      // child: Text('Activity Details'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller:
                            state is RecordSowingInitial ? state.details : null,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          fillColor: backgroundColor2,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 15,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                    if (activityRecordValues[widget.recordName] ==
                        ActivityTypeEnums.irrigation) ...[
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('Watering hours'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        // child is a dropdown field of number [1-24]
                        child: DropdownButtonFormField<String>(
                          isDense: false,
                          // menuMaxHeight:
                          // getProportionateScreenHeight(40),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          isExpanded: true,
                          decoration: InputDecoration(
                            fillColor: backgroundColor2,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(0.2),
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              // vertical: 5,
                              horizontal: 3,
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            hintText: '',
                            filled: true,
                          ),
                          // decoration: ShapeDecoration(),
                          // itemHeight: 300,
                          elevation: 16,
                          // value: hours.first,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                          ),
                          items: List.generate(24, (index) => index)
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: value.toString(),
                              child: ListTile(
                                title: Text(value.toString()),
                              ),
                            );
                          }).toList(),
                          hint: const Text('Select hours'),

                          onChanged: (String? val) {
                            // print('on pressed called');
                            if (val != null) {
                              if (state is RecordSowingInitial) {
                                state.irrigationWateringHours.text = val;
                              }
                              // unitController.text = val;
                            }
                          },
                        ),
                        // child: TextFormField(
                        //   controller: state is RecordSowingInitial
                        //       ? state.irrigationWateringHours
                        //       : null,
                        //   keyboardType: TextInputType.multiline,
                        //   decoration: InputDecoration(
                        //     fillColor: backgroundColor2,
                        //     border: const OutlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(15)),
                        //     ),
                        //     contentPadding: const EdgeInsets.symmetric(
                        //       // vertical: 20,
                        //       horizontal: 15,
                        //     ),
                        //     focusedBorder: OutlineInputBorder(
                        //       borderRadius:
                        //           const BorderRadius.all(Radius.circular(10)),
                        //       borderSide: BorderSide(
                        //         color: Colors.black.withOpacity(0.2),
                        //       ),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius:
                        //           const BorderRadius.all(Radius.circular(10)),
                        //       borderSide: BorderSide(
                        //         color: Colors.black.withOpacity(0.2),
                        //       ),
                        //     ),
                        //     filled: true,
                        //   ),
                        // ),
                      ),
                    ],
                    // TextButton(
                    //   child: Text('stop loading'),
                    //   onPressed: () {
                    //     context.read<RecordSowingBloc>().add(
                    //           RecordSowingLoadingStopEvent(),
                    //         );
                    //   },
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: HarvestBottomButtonLoading(
          batchID: widget.batchID,
          whatType: activityRecordValues[widget.recordName]!,
        ),
      ),
    );
  }
}
