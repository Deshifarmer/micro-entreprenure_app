import 'package:deshifarmer/core/params/batch_params.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/activity_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/components/folon_batch.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/activity_type_select.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BatchListPage extends StatefulWidget {
  const BatchListPage({
    required this.farmID,
    super.key,
  });
  final String farmID;

  @override
  State<BatchListPage> createState() => _BatchListPageState();
}

class _BatchListPageState extends State<BatchListPage> {
  // final TextEditingController _seasonController = TextEditingController();
  String _season = '';

  final TextEditingController _crop = TextEditingController();

  final TextEditingController _jatt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token = loginState is LoginSuccess
        ? loginState.successLoginEntity.token
        : '';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              'ফলন ব্যাচ ',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: getProportionateScreenHeight(40),
            ),
            child:  FolonBatchData(
              token: token,
              farmID: widget.farmID,
            ),

            // child: Wrap(
            //   alignment: WrapAlignment.center,
            //   spacing: 10,
            //   children: [
            //     for (final s in listOfActivities)
            //       FilterChip(
            //         side: const BorderSide(
            //           color: Colors.transparent,
            //         ),
            //         // selectedColor: Colors.red,
            //         // selectedShadowColor: Colors.pink,
            //         // surfaceTintColor: Colors.green,
            //         // backgroundColor: Colors.cyan,
            //         // shadowColor: Colors.indigo,
            //         // disabledColor: Colors.brown,
            //         color: const MaterialStatePropertyAll(Colors.white),
            //         label: Text(s),
            //         onSelected: (bool isSelected) {
            //           // if (isSelected) {
            //           //   _activityTypes.add(s);
            //           // } else {
            //           //   _activityTypes.remove(s);
            //           // }
            //           // setState(() {});
            //         },
            //         // selected: _activityTypes.contains(s),
            //       ),
            //   ],
            // ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Text(
              'অথবা নতুন ব্যাচ তৈরী করুন ',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField<String>(
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
              value: BatchParams.seasons.first,
              items: BatchParams.seasons
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  // alignment: Alignment.center,
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? val) {
                if (val != null) {
                  // _seasonController.text = val;
                  setState(() {
                    _season = val;
                  });
                  debugPrint('new season -> $_season');
                }
                // if (state is RecordSowingInitial) {
                //   state.quantity.text = val.toString();
                // }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _crop,
              //     state is RecordSowingInitial ? state.unit : null,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: backgroundColor2,
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                hintText: 'ফসল ',
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
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _jatt,
              //     state is RecordSowingInitial ? state.unit : null,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: backgroundColor2,
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                hintText: 'জাত ',
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
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: loginState is LoginSuccess
          ? _jatt.text.isNotEmpty &&
                  _crop.text.isNotEmpty &&
                  _season.isNotEmpty &&
                  _season != BatchParams.seasons.first
              // ? SecondayButtonGreen(
              //     btnColor: priceBoxColor,
              //     onpress: () async {
              //       final activityState = context.read<ActivityBloc>().state;
              //       if (activityState is ActivityInitial) {
              //         if (activityState.farmerID.text.isEmpty) {
              //           // errorSnackBar('Select a farmer');
              //           ScaffoldMessenger.of(context)
              //               .showSnackBar(errorSnackBar('Select a farmer'));
              //         } else if (activityState.farmID.text.isEmpty) {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //               errorSnackBar('Select Farm for this Farmer'));
              //         } else {
              //           // debugPrint('get the farmer id -> ${activityState.farmerID.text}');
              //           // debugPrint('get the farm id -> ${activityState.farmID.text}');
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute<ActivityTypeSelection>(
              //               builder: (context) => ActivityTypeSelection(
              //                 farmID: activityState.farmID.text,
              //                 farmerID: activityState.farmerID.text,
              //               ),
              //             ),
              //           );
              //         }
              //       }
              //     },
              //     title: 'পরবর্তী ',
              //     // title: 'continue',
              //   )
              ? BatchButtonSuccess(
                  farmID: widget.farmID,
                  season: _season,
                  token: loginState.successLoginEntity.token,
                  crop: _crop.text,
                  jatt: _jatt.text,
                )
              //         FutureBuilder<BatchEnity?>(
              //   future: DeshiFarmerAPI().batchCreationAPI(
              //     _seasonController.text,
              //     _crop.text,
              //     widget.farmID,
              //     loginState.successLoginEntity.token,
              //   ),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData && snapshot.connectionState == ConnectionState.done){

              //     }
              //     return SecondayButtonGreen(
              //       btnColor: priceBoxColor,
              //       onpress: () async {
              //         final activityState =
              //             context.read<ActivityBloc>().state;
              //         if (activityState is ActivityInitial) {
              //           if (activityState.farmerID.text.isEmpty) {
              //             // errorSnackBar('Select a farmer');
              //             ScaffoldMessenger.of(context)
              //                 .showSnackBar(errorSnackBar('Select a farmer'));
              //           } else if (activityState.farmID.text.isEmpty) {
              //             ScaffoldMessenger.of(context).showSnackBar(
              //                 errorSnackBar('Select Farm for this Farmer'));
              //           } else {
              //             // debugPrint('get the farmer id -> ${activityState.farmerID.text}');
              //             // debugPrint('get the farm id -> ${activityState.farmID.text}');
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute<ActivityTypeSelection>(
              //                 builder: (context) => ActivityTypeSelection(
              //                   farmID: activityState.farmID.text,
              //                   farmerID: activityState.farmerID.text,
              //                 ),
              //               ),
              //             );
              //           }
              //         }
              //       },
              //       title: 'পরবর্তী ',
              //       // title: 'continue',
              //     );
              //   },
              // )
              : null
          : null,
    );
  }
}

class BatchButtonSuccess extends StatefulWidget {
  const BatchButtonSuccess({
    required this.season,
    required this.crop,
    required this.jatt,
    required this.token,
    required this.farmID,
    super.key,
  });
  final String season;
  final String crop;
  final String jatt;
  final String token;
  final String farmID;

  @override
  State<BatchButtonSuccess> createState() => _BatchButtonSuccessState();
}

class _BatchButtonSuccessState extends State<BatchButtonSuccess> {
  @override
  void dispose() {
    isLoadin = false;
    super.dispose();
  }

  @override
  bool isLoadin = false;
  @override
  Widget build(BuildContext context) {
    return isLoadin
        ? Container(
            // width: 10,
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
            height: getProportionateScreenHeight(30),
            alignment: Alignment.center,
            child: const PrimaryLoadingIndicator(),
          )
        : SecondayButtonGreen(
            btnColor: priceBoxColor,
            onpress: () async {
              if (widget.season == BatchParams.seasons.first) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(errorSnackBar(BatchParams.seasons.first));
              } else {
                setState(() {
                  isLoadin = true;
                });

                final result = await DeshiFarmerAPI().batchCreationAPI(
                  token: widget.token,
                  season: widget.season,
                  farmID: widget.farmID,
                  whichCrop: '${widget.crop} (${widget.jatt})',
                );
                if (result != null) {
                  setState(() {
                    isLoadin = false;
                  });
                  final activityState = context.read<ActivityBloc>().state;
                  if (activityState is ActivityInitial) {
                    if (activityState.farmerID.text.isEmpty) {
                      // errorSnackBar('Select a farmer');
                      ScaffoldMessenger.of(context)
                          .showSnackBar(errorSnackBar('Select a farmer'));
                    } else if (activityState.farmID.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar('Select Farm for this Farmer'));
                    } else {
                      // debugPrint('get the farmer id -> ${activityState.farmerID.text}');
                      // debugPrint('get the farm id -> ${activityState.farmID.text}');
                      Navigator.push(
                        context,
                        MaterialPageRoute<ActivityTypeSelection>(
                          builder: (context) => ActivityTypeSelection(
                            // farmID: activityState.farmID.text,
                            // farmerID: activityState.farmerID.text,
                            batchID: result.batch_id,
                          ),
                        ),
                      );
                    }
                  }
                } else {
                  setState(() {
                    isLoadin = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      errorSnackBar('ব্যাচ সৃষ্টি ব্যর্থ হয়েছে'));
                }
              }
            },
            title: 'পরবর্তী ',
            // title: 'continue',
          );
  }
}
