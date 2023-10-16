import 'package:deshifarmer/data/models/record_activity_model.dart';
import 'package:deshifarmer/presentation/blocs/record_sowing/record_sowing_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class HarvestBottomButtonLoading extends StatefulWidget {
  const HarvestBottomButtonLoading({
    required this.batchID,
    required this.whatType,
    super.key,
  });

  final ActivityTypeEnums whatType;
  final String batchID;

  @override
  State<HarvestBottomButtonLoading> createState() =>
      _HarvestBottomButtonLoadingState();
}

class _HarvestBottomButtonLoadingState
    extends State<HarvestBottomButtonLoading> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecordSowingBloc, RecordSowingState>(
      listener: (context, state) {
        if (state is RecordSowingSuccess || state is RecordSowingFailed) {
          debugPrint('failed or success');
          // clear all the data
          // context.read<RecordSowingBloc>().add(
          //       RecordSowingClearEvent(),
          //     );
          setState(() {
            isLoading = false;
          });
          if (state is RecordSowingLoading) {
            debugPrint('loading');
            setState(() {
              isLoading = true;
            });
            debugPrint('checking loading -> $isLoading');
            // after 3 sec stop the loading
            // Future.delayed(const Duration(seconds: 3), () {
            //   setState(() {
            //     isLoading = false;
            //   });
            //   // RecordSowingLoadingStopEvent
            //   context.read<RecordSowingBloc>().add(
            //         RecordSowingLoadingStopEvent(),
            //       );
            // });
          }
        }
      },
      builder: (context, state) {
        debugPrint('current state -> $state');
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
                      final token = loginState is LoginSuccess
                          ? loginState.successLoginEntity.token
                          : '';

                      final ram = RecordActivityModel(
                        token: token,
                        batchID: widget.batchID,
                        landPepData: state.landPepDate.text,
                        details: state.details.text,
                        images: state.images,
                        whatType: widget.whatType,
                        fertilizerAmount: state.fertilizerAmount.text,
                        fertilizerName: state.fertilizerName.text,
                        fertilizerType: state.fertilizerType.text,
                        irrigationWateringHours:
                            state.irrigationWateringHours.text.isEmpty
                                ? '0'
                                : state.irrigationWateringHours.text,
                        pesticideAmount: state.pesticideAmount.text,
                        pesticideName: state.pesticideName.text,
                        pesticideType: state.pesticideType.text,
                        sowingCrop: state.sowingCrop.text,
                        sowingNameWithCompany: state.sowingNameWithCompany.text,
                        sowingSeedUnit: state.sowingSeedUnit.text.isEmpty
                            ? 'KG'
                            : state.sowingSeedUnit.text,
                        sowingSeedPrice: state.sowingSeedPrice.text,
                        sowingSeedQuantity: state.sowingSeedQuantity.text,
                      );
                      // now print all these values
                      debugPrint('details: ${ram.details}');
                      debugPrint('images: ${ram.images}');
                      debugPrint('date: ${ram.landPepData}');
                      debugPrint('whatType: ${ram.whatType}');
                      debugPrint(
                        'sowingSeedQuantity: ${ram.sowingSeedQuantity}',
                      );
                      debugPrint('fertilizerAmount: ${ram.fertilizerAmount}');
                      debugPrint('fertilizerName: ${ram.fertilizerName}');
                      debugPrint('fertilizerType: ${ram.fertilizerType}');
                      debugPrint(
                        'irrigationWateringHours: ${ram.irrigationWateringHours}',
                      );
                      debugPrint('pesticideAmount: ${ram.pesticideAmount}');
                      debugPrint('pesticideName: ${ram.pesticideName}');
                      debugPrint('pesticideType: ${ram.pesticideType}');
                      debugPrint('sowingCrop: ${ram.sowingCrop}');
                      debugPrint(
                        'sowingNameWithCompany: ${ram.sowingNameWithCompany}',
                      );
                      debugPrint('token: $token');
                      debugPrint('batchID: ${widget.batchID}');
                      debugPrint('whatType: ${widget.whatType}');
                      context.read<RecordSowingBloc>().add(
                            RecordSowingPostEvent(ram),
                          );
                    },
                    title: 'সেভ করুন',
                  )
                : const SizedBox.shrink();
      },
    );
  }
}
