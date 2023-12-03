import 'package:deshifarmer/core/params/batch_params.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/harvest_api.dart';
import 'package:deshifarmer/presentation/pages/finance_page/api/finance_api.dart';
import 'package:deshifarmer/presentation/pages/finance_page/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/finance_page/components/select_farmer_for_finance.dart';
import 'package:deshifarmer/presentation/pages/finance_page/models/fianance_model.dart';
import 'package:deshifarmer/presentation/pages/finance_page/pages/finance_page2.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// {@template finance_page_body}
/// Body of the FinancePagePage.
///
/// Add what it does
/// {@endtemplate}
class FinancePageBody extends StatefulWidget {
  /// {@macro finance_page_body}
  const FinancePageBody({super.key});

  @override
  State<FinancePageBody> createState() => _FinancePageBodyState();
}

class _FinancePageBodyState extends State<FinancePageBody> {
  final TextEditingController _varietyController = TextEditingController();

  final TextEditingController _noteController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _seasonEndETASalController =
      TextEditingController();

  String? cropp;

  String? pol;

  String? season;

  String? farmerID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancePageBloc, FinancePageState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: ListView(
            cacheExtent: 1000,
            children: [
              Text(
                'Farmer details',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              //* select farmer
              SelectFarmerForFinance(
                onChanged: (farmerID) {
                  this.farmerID = farmerID;
                },
              ),
              //* Season
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DropdownButtonFormField<String>(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  focusColor: backgroundColor2,
                  dropdownColor: backgroundColor2,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    fillColor: backgroundColor2,
                    // contentPadding: EdgeInsets.all(10),
                  ),
                  // decoration: ShapeDecoration(),

                  elevation: 16,
                  // value: BatchParams.seasons.first,
                  items: BatchParams.seasons
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      // alignment: Alignment.center,
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text('Season'),
                  onChanged: (String? val) {
                    if (val != null) {
                      season = val;
                    }
                    // if (state is RecordSowingInitial) {
                    //   state.quantity.text = val.toString();
                    // }
                  },
                ),
              ),
              //* Producing crop
              FutureBuilder<List<SingleCropEntity>>(
                builder:
                    (context, AsyncSnapshot<List<SingleCropEntity>> snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    final data = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: DropdownButtonFormField<SingleCropEntity>(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        focusColor: backgroundColor2,
                        dropdownColor: backgroundColor2,
                        isExpanded: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          filled: true,
                          fillColor: backgroundColor2,
                          // contentPadding: EdgeInsets.all(10),
                        ),
                        // decoration: ShapeDecoration(),

                        elevation: 16,
                        // value: BatchParams.seasons.first,
                        items: data!.map<DropdownMenuItem<SingleCropEntity>>(
                            (SingleCropEntity value) {
                          return DropdownMenuItem<SingleCropEntity>(
                            // alignment: Alignment.center,
                            value: value,
                            child: Text(value.name),
                          );
                        }).toList(),
                        hint: const Text('Producing crop'),
                        onChanged: (SingleCropEntity? val) {
                          if (val != null) {
                            cropp = val.name;
                          }
                        },
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: DropdownButtonFormField<String>(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      focusColor: backgroundColor2,
                      dropdownColor: backgroundColor2,
                      isExpanded: true,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: true,
                        fillColor: backgroundColor2,
                        // contentPadding: EdgeInsets.all(10),
                      ),
                      // decoration: ShapeDecoration(),

                      elevation: 16,
                      // value: BatchParams.seasons.first,
                      items: BatchParams.seasons
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          // alignment: Alignment.center,
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: const Text('Producing crop'),
                      onChanged: null,
                    ),
                  );
                },
                future: HarvestAPI().getCropFromAnotherAPI(),
              ),
              //* Variety
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _varietyController,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 25,
                    ),
                    // hoverColor: Colors.green,
                    // focusColor: Colors.greenAccent,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // borderSide: BorderSide(
                      //   color: Colors.greenAccent.withOpacity(0.5),
                      // ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Variety',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              //* Purpose of loan

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DropdownButtonFormField<String>(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  focusColor: backgroundColor2,
                  dropdownColor: backgroundColor2,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    fillColor: backgroundColor2,
                    // contentPadding: EdgeInsets.all(10),
                  ),
                  // decoration: ShapeDecoration(),

                  elevation: 16,
                  // value: BatchParams.seasons.first,
                  items: activityRecordValues.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      // alignment: Alignment.center,
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text('Purpose of loan'),
                  onChanged: (v) {
                    pol = v;
                  },
                ),
              ),

              ///* amount of loan
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefix: const Text('৳ '),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 25,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'amount of loan',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              //* season end ETA sales
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _seasonEndETASalController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 25,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'season end ETA sales',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),

              ///* Notes for the partner
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _noteController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 25,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    hintText: 'notes for the partner',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              SecondayButtonGreen(
                onpress: () async {
                  if (farmerID == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a farmer'),
                      ),
                    );
                    return;
                  }
                  if (season == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a season'),
                      ),
                    );
                    return;
                  }
                  if (pol == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a purpose of loan'),
                      ),
                    );
                    return;
                  }
                  if (cropp == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a crop'),
                      ),
                    );
                    return;
                  }
                  if (_amountController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a amount'),
                      ),
                    );
                    return;
                  }
                  final fm = FinanceModel(
                    farmerID: farmerID!,
                    season: season!,
                    crop: cropp!,
                    variety: _varietyController.text.isEmpty
                        ? null
                        : _varietyController.text,
                    pol: pol!,
                    // amount: _amountController.text,
                    eta: _seasonEndETASalController.text.isEmpty
                        ? null
                        : _seasonEndETASalController.text,
                    note: _noteController.text.isEmpty
                        ? null
                        : _noteController.text,
                  );
                  debugPrint(
                    'Farmer ID -> $farmerID',
                  );

                  debugPrint(
                    'season -> $season',
                  );
                  debugPrint(
                    'Purpose of loan -> $pol',
                  );
                  debugPrint(
                    'Corp -> $cropp',
                  );
                  debugPrint(
                    'Variety -> ${_varietyController.text}',
                  );
                  debugPrint(
                    'Amount -> ${_amountController.text}',
                  );
                  debugPrint(
                    'Season end ETA sales -> ${_seasonEndETASalController.text}',
                  );
                  debugPrint(
                    'Note -> ${_noteController.text}',
                  );
                  // final loginState = context.read<LoginBloc>().state;
                  // final token = loginState is LoginSuccess
                  //     ? loginState.successLoginEntity.token
                  //     : '';
                  // final isReq = await FinanceAPI().postFinance(fm, token);

                  // if (isReq) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => FinancePage2(
                              fm: fm,
                              ammount: int.parse(_amountController.text),
                            )),
                  );
                  // } else {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Something went wrong'),
                  //     ),
                  //   );
                  // }
                },
                title: 'continue to schedule payment',
              ),
            ],
          ),
        );
      },
    );
  }
}
