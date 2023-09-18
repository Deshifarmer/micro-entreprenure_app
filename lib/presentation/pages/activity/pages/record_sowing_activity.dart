import 'package:deshifarmer/data/models/record_activity_model.dart';
import 'package:deshifarmer/presentation/blocs/record_sowing/record_sowing_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/activity/components/get_recorded_photo.dart';
import 'package:deshifarmer/presentation/pages/activity/components/select_crop_activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';

class RecordSowingActivity extends StatefulWidget {
  const RecordSowingActivity({
    required this.recordName,
    required this.batchID,
    super.key,
  });

  final String recordName;
  final String batchID;
  @override
  State<RecordSowingActivity> createState() => _RecordSowingActivityState();
}

class _RecordSowingActivityState extends State<RecordSowingActivity> {
  /// NOTE: LandPREF

  /// for the landsize
  final TextEditingController landprefSize = TextEditingController();

  /// chemial
  final TextEditingController landprefChemical = TextEditingController();

  /// chemical company
  final TextEditingController landprefChemicalCompany = TextEditingController();

  /// chemical  quanity
  final TextEditingController landprefChemicalQuantity =
      TextEditingController();

  /// Date
  DateTime? _landprefDate = DateTime.now();
  TextEditingController _landprefDateController = TextEditingController();

  /// NOTE: sowing

  /// company
  final TextEditingController sowingSeedCompany = TextEditingController();
  final TextEditingController sowingSeedQuantity = TextEditingController();
  final TextEditingController sowingSeedPrice = TextEditingController();
  final TextEditingController sowingExpectedHarvest = TextEditingController();
  String sowingSeedsource = '';

  /// Date
  DateTime? _sowingDate = DateTime.now();
  final TextEditingController _sowingDateController = TextEditingController();

  /// Date
  DateTime? _irrigationDate = DateTime.now();
  TextEditingController _irrigationDateController = TextEditingController();

  /// Date
  DateTime? _weedingDate = DateTime.now();
  TextEditingController _weedingDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print(
        'name -> ${widget.recordName} ${activityRecordValues[widget.recordName] == ActivityTypeEnums.landpref}');

    // final recordSowingState = context.read<RecordSowingBloc>().state;
    return Scaffold(
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
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('রেকর্ড ${widget.recordName}',
                        // child: Text('Record Sowing',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'একটি কার্যকলাপ রেকর্ড করার সময় আপনার অবস্থান স্বয়ংক্রিয়ভাবে ক্যাপচার করা হবে',
                      // 'Your location will be automatically captured while recording an activity',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: RecordActivityPicUpload(),
                  ),
                  if (activityRecordValues[widget.recordName] ==
                      ActivityTypeEnums.landpref) ...[
                    ///NOTE: land PREF
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Land Size'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: landprefSize,
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
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Land preparation Date'),
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
                          // contentPadding: EdgeInsets.symmetric(
                          //   horizontal: 20,
                          //   vertical: 5,
                          // ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(15)),
                          //   borderSide: BorderSide.none,
                          // ),
                          // labelText: '',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          hintText: '',
                          filled: true,
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Chemicals'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: landprefChemical,
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
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Chemical Company'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: landprefChemicalCompany,
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
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Chemical Quantity'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: landprefChemicalQuantity,
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
                  ] else if (activityRecordValues[widget.recordName] ==
                      ActivityTypeEnums.sowing) ...[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Seed Company'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: sowingSeedCompany,
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
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Seed Quantity'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: sowingSeedQuantity,
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
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Seed Price'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: sowingSeedPrice,
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

                    /// seed sourcej
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Seed Source'),
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
                        value: '',
                        items: ['', 'Deshifarmer Ltd.', 'Outside']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            // alignment: Alignment.center,
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? val) {
                          if (val != null) {
                            sowingSeedsource = val;
                          }
                          // if (state is RecordSowingInitial) {
                          //   state.quantity.text = val.toString();
                          // }
                        },
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Sowing Date'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _sowingDateController,
                        onTap: () async {
                          _sowingDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          _sowingDateController.text =
                              _sowingDate.toString().split(' ').first;
                        },
                        keyboardType: TextInputType.none,
                        decoration: InputDecoration(
                          // fillColor: backgroundColor2,
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
                          // contentPadding: EdgeInsets.symmetric(
                          //   horizontal: 20,
                          //   vertical: 5,
                          // ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(15)),
                          //   borderSide: BorderSide.none,
                          // ),
                          // labelText: '',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          // hintText: '',
                          // filled: true,
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(8),
                      // child: Text('Unit'),
                      child: Text('Expected Harvest'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        controller: sowingExpectedHarvest,
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
                  ] else if (activityRecordValues[widget.recordName] ==
                      ActivityTypeEnums.irrigation) ...[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Irrigation Date'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _irrigationDateController,
                        onTap: () async {
                          _irrigationDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          _irrigationDateController.text =
                              _irrigationDate.toString().split(' ').first;
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
                          // contentPadding: EdgeInsets.symmetric(
                          //   horizontal: 20,
                          //   vertical: 5,
                          // ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(15)),
                          //   borderSide: BorderSide.none,
                          // ),
                          // labelText: '',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          hintText: '',
                          filled: true,
                        ),
                      ),
                    ),
                  ] else if (activityRecordValues[widget.recordName] ==
                      ActivityTypeEnums.weeding) ...[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: Text('Unit'),
                      child: Text('Weeding Date'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: _weedingDateController,
                        onTap: () async {
                          _weedingDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now(),
                          );
                          _weedingDateController.text =
                              _weedingDate.toString().split(' ').first;
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
                          // contentPadding: EdgeInsets.symmetric(
                          //   horizontal: 20,
                          //   vertical: 5,
                          // ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(15)),
                          //   borderSide: BorderSide.none,
                          // ),
                          // labelText: '',
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          hintText: '',
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ক্রপ নির্বাচন করুন (ঐচ্ছিক)'),
                    // child: Text('Select crop (Optional)'),
                  ),
                  const SelectCropOptional(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('পরিমাণ'),
                    // child: Text('Quantity'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: DropdownButtonFormField<int>(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                      value: 0,
                      items: List.generate(10, (index) => index)
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          // alignment: Alignment.center,
                          value: value,
                          child: Text(value.toString()),
                        );
                      }).toList(),
                      onChanged: (int? val) {
                        if (state is RecordSowingInitial) {
                          state.quantity.text = val.toString();
                        }
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    // child: Text('Unit'),
                    child: Text('ইউনিট'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller:
                          state is RecordSowingInitial ? state.unit : null,
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
                    padding: EdgeInsets.all(8.0),
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
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(15)),
                        //   borderSide: BorderSide(
                        //     color: Colors.black.withOpacity(0.2),
                        //   ),
                        // ),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // bottomNavigationBar: BlocConsumer<RecordSowingBloc, RecordSowingState>(
      //   listener: (context, state) {},
      //   builder: (context, state) {
      //     if (state is RecordSowingInitial) {
      //       print('Record intit');
      //       return SecondayButtonGreen(
      //         onpress: () async {
      //           final loginState = context.read<LoginBloc>().state;
      //           final userProfile = context.read<UserProfileBloc>().state;
      //           if (loginState is LoginSuccess &&
      //               userProfile is UserProfileFetchSuccess) {
      //             final ram = RecordActivityModel(
      //               crop: state.crop.text,
      //               details: state.details.text,
      //               farmID: farmID,
      //               farmerID: farmerID,
      //               images: state.images,
      //               name: activityTypes.first,
      //               quantity: state.quantity.text.isEmpty
      //                   ? 0.toString()
      //                   : state.quantity.text,
      //               activityBy: userProfile.userProfile.df_id ?? '',
      //               token: loginState.successLoginEntity.token,
      //               type: activityTypes.toString(),
      //               unit: state.unit.text,
      //             );
      //             context
      //                 .read<RecordSowingBloc>()
      //                 .add(RecordSowingPostEvent(ram));
      //           }
      //         },
      //         title: 'record',
      //       );
      //     }
      //     if (state is RecordSowingLoading) {
      //       print('laoding state from Record sowing');
      //       return const Center(child: PrimaryLoadingIndicator());
      //     }
      //     print('No state in record');
      //     return const SizedBox.shrink();
      //   },
      // ),
      bottomNavigationBar: BottomButtonLoading(
        batchID: widget.batchID,
        whatType: activityRecordValues[widget.recordName]!,
        landSize: landprefSize.text,
        weedingDate: _weedingDate != null ? _weedingDate.toString() : '',
        landPreDate: _landprefDate.toString(),
        landChemical: landprefChemical.text,
        irrigatinDate:
            _irrigationDate != null ? _irrigationDate.toString() : '',
        sowingSeedDate: _sowingDate != null ? _sowingDate.toString() : '',
        sowingseedPrice: sowingSeedPrice.text,
        sowingSeedSource: sowingSeedsource,
        sowingSeedCompany: sowingSeedCompany.text,
        sowingSeedQuantity: sowingSeedQuantity.text,
        landChemicalCompany: landprefChemicalCompany.text,
        landChemicalQuantity: landprefChemicalQuantity.text,
        sowingExpectedHarvest: sowingExpectedHarvest.text,
        // farmID: widget.farmID,
        // farmerID: widget.farmerID,
        // activityTypes: widget.activityTypes,
      ),
    );
  }
}

class BottomButtonLoading extends StatefulWidget {
  const BottomButtonLoading({
    required this.batchID,
    required this.whatType,
    required this.sowingExpectedHarvest,
    required this.sowingSeedDate,
    required this.sowingSeedSource,
    required this.sowingseedPrice,
    required this.sowingSeedQuantity,
    required this.sowingSeedCompany,
    required this.landChemicalQuantity,
    required this.landChemicalCompany,
    required this.landChemical,
    required this.landSize,
    required this.irrigatinDate,
    required this.weedingDate,
    required this.landPreDate,
    // required this.activityTypes,
    // required this.ram,
    // required this.farmID,
    super.key,
  });
  // final String farmID;
  // final RecordActivityModel ram;
  // final String activityTypes;

  final ActivityTypeEnums whatType;
  final String batchID;
  final String sowingExpectedHarvest;
  final String sowingSeedQuantity;
  final String sowingSeedCompany;
  final String sowingSeedDate;
  final String sowingseedPrice;
  final String sowingSeedSource;
  final String landSize;
  final String landPreDate;
  final String landChemical;
  final String landChemicalCompany;
  final String landChemicalQuantity;
  final String weedingDate;
  final String irrigatinDate;

  @override
  State<BottomButtonLoading> createState() => _BottomButtonLoadingState();
}

class _BottomButtonLoadingState extends State<BottomButtonLoading> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordSowingBloc, RecordSowingState>(
      listener: (context, state) {
        if (state is RecordSowingSuccess || state is RecordSowingFailed) {
          print('failed or success');
          setState(() {
            isLoading = false;
          });
          if (state is RecordSowingLoading) {
            print('loading');
            setState(() {
              isLoading = true;
            });
          }
        }
      },
      builder: (context, state) {
        return isLoading
            ? const Center(child: PrimaryLoadingIndicator())
            : state is RecordSowingInitial
                ? SecondayButtonGreen(
                    btnColor: priceBoxColor,
                    onpress: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final loginState = context.read<LoginBloc>().state;
                      final userProfile = context.read<UserProfileBloc>().state;
                      if (loginState is LoginSuccess &&
                          userProfile is UserProfileFetchSuccess) {
                        // print({
                        //   "crop": state.crop.text,
                        //   "details": state.details.text,
                        //   "images": state.images,
                        //   "quantity": state.quantity.text.isEmpty
                        //       ? 0.toString()
                        //       : state.quantity.text,
                        //   "activityBy": userProfile.userProfile.df_id ?? '',
                        //   "token": loginState.successLoginEntity.token,
                        //   "unit": state.unit.text,
                        // }.toString());
                        final ram = RecordActivityModel(
                          crop: state.crop.text,
                          details: state.details.text,
                          images: state.images,
                          quantity: state.quantity.text.isEmpty
                              ? 0.toString()
                              : state.quantity.text,
                          token: loginState.successLoginEntity.token,
                          unit: state.unit.text,
                          whatType: widget.whatType,
                          batchID: widget.batchID,
                          sowingExpectedHarvest: widget.sowingExpectedHarvest,
                          sowingSeedQuantity: widget.sowingSeedQuantity,
                          sowingSeedCompany: widget.sowingSeedQuantity,
                          sowingSeedDate: widget.sowingSeedDate,
                          sowingseedPrice: widget.sowingseedPrice,
                          sowingSeedSource: widget.sowingSeedSource,
                          landSize: widget.landSize,
                          landPreDate: widget.landPreDate,
                          landChemical: widget.landChemical,
                          landChemicalCompany: widget.landChemicalCompany,
                          landChemicalQuantity: widget.landChemicalQuantity,
                          weedingDate: widget.weedingDate,
                          irrigatinDate: widget.irrigatinDate,
                        );
                        context.read<RecordSowingBloc>().add(
                              RecordSowingPostEvent(ram),
                            );
                      }
                    },
                    title: 'record',
                  )
                : const SizedBox.shrink();
      },
    );
  }
}
