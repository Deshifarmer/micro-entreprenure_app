import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/batch/batch_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/harvest_api.dart';
import 'package:deshifarmer/presentation/pages/activity/models/batch_reponse_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/record_sowing_activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewBatchData extends StatelessWidget {
  const ViewBatchData({required this.batchEnity, super.key});

  final BatchEnity batchEnity;

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            //* Batch Detail box
            Text(
              'Batch Detail',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: tertiaryColor),
            ),
            Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Batch ID: '),
                        Text(batchEnity.batch_id),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Farm ID: '),
                        Text(batchEnity.farm_id),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Season: '),
                        Text(batchEnity.season),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Crops: '),
                        Text(batchEnity.which_crop),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            FutureBuilder(
              future: HarvestAPI().getBatchData(
                token: token,
                bID: batchEnity.batch_id,
              ),
              builder: (c, AsyncSnapshot<BatchResponseEntity?> snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      //* Batch Detail box
                      Text(
                        'Batch Details',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: tertiaryColor),
                      ),

                      if (snapshot.data?.land_preparation != null)
                        Card(
                          child: Column(
                            children: [
                              const Text('Land Preparation Detail'),
                              // show images as a slider here
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                        .data!.land_preparation!.images.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: CachedNetworkImage(
                                        imageUrl: checkDomain(
                                                Strings.getServerOrLocal(
                                                    ServerOrLocal.server,),)
                                            ? dummyImage
                                            : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${snapshot.data!.land_preparation!.images[index]}',
                                        // placeholder: (context, url) =>
                                        //     const PrimaryLoadingIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                        // imageBuilder: (context, imageProvider) => Container(
                                        //   decoration: BoxDecoration(
                                        //     image: DecorationImage(
                                        //       image: imageProvider,
                                        //       fit: BoxFit.cover,
                                        //     ),
                                        //   ),
                                        // ),
                                        // placeholder: (context, url) => const PrimaryLoadingIndicator(),
                                        // errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Land Preparation Date: '),
                                    Text(
                                      snapshot.data!.land_preparation!
                                          .land_preparation_date,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Detail: '),
                                    Text(
                                      snapshot.data!.land_preparation!.details,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Details: '),
                                    Text(
                                      snapshot.data!.land_preparation!.details,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (snapshot.data?.sowing != null)
                        Card(
                          child: Column(
                            children: [
                              const Text('Sowing Detail'),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Seed Name: '),
                                    Text(
                                      snapshot.data!.sowing!.seed_name ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Seed Company: '),
                                    Text(
                                      snapshot.data!.sowing!.seed_company ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Seed Price: '),
                                    Text(
                                      snapshot.data!.sowing!.seed_price ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Seed Unit: '),
                                    Text(
                                      '${snapshot.data!.sowing!.seed_quantity} ${snapshot.data!.sowing!.seed_unit}',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Details: '),
                                    Text(snapshot.data!.sowing!.details ?? ''),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (snapshot.data?.fertilization != null)
                        Card(
                          child: Column(
                            children: [
                              const Text('Fertilization Detail'),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Fertilizer Name: '),
                                    Text(
                                      snapshot
                                          .data!.fertilization!.fertilizer_name,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Fertilizer Type: '),
                                    Text(
                                      snapshot
                                          .data!.fertilization!.fertilizer_type,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Fertilizer Price: '),
                                    Text(
                                      snapshot.data!.fertilization!.amount,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(child: Text('Details: ')),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.fertilization!.details,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      if (snapshot.data?.pesticide != null)
                        Card(
                          child: Column(
                            children: [
                              const Text('Pesticide Detail'),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Fertilizer Name: '),
                                    Text(
                                      snapshot.data!.pesticide!.pesticide_name,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Fertilizer Type: '),
                                    Text(
                                      snapshot.data!.pesticide!.pesticide_type,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Fertilizer Price: '),
                                    Text(
                                      snapshot.data!.pesticide!.amount,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(child: Text('Details: ')),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.pesticide!.details,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      if (snapshot.data?.watering != null)
                        Card(
                          child: Column(
                            children: [
                              const Text('Watering Detail'),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Hours: '),
                                    Text(
                                      snapshot.data!.watering!.hours,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Expanded(child: Text('Detail: ')),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.watering!.details,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (snapshot.data?.sourcing != null)
                        const Text('souring'),

                      if (snapshot.data?.land_preparation == null ||
                          snapshot.data?.sowing == null ||
                          snapshot.data?.fertilization == null ||
                          snapshot.data?.pesticide == null ||
                          snapshot.data?.watering == null ||
                          snapshot.data?.sourcing == null)
                        SecondayButtonGreen(
                          onpress: () async {
                            // show a dialog to add new activity
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Add New Activity'),
                                content: AddNewActivityFromDialog(
                                  snapshot: snapshot.data,
                                  batchID: batchEnity.batch_id,
                                ),

                                // actions: [
                                //   TextButton(
                                //     onPressed: () {
                                //       Navigator.pop(context);
                                //     },
                                //     child: const Text('Cancel'),
                                //   ),
                                //   TextButton(
                                //     onPressed: () {
                                //       Navigator.pop(context);
                                //     },
                                //     child: const Text('Save'),
                                //   ),
                                // ],
                              ),
                            );
                          },
                          title: 'নতুন কার্যালাপ যোগ করুন',
                        ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.redAccent,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  );
                }
                return const Center(
                  child: PrimaryLoadingIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddNewActivityFromDialog extends StatefulWidget {
  const AddNewActivityFromDialog({
    required this.snapshot,
    required this.batchID,
    super.key,
  });

  final BatchResponseEntity? snapshot;
  final String batchID;

  @override
  State<AddNewActivityFromDialog> createState() =>
      _AddNewActivityFromDialogState();
}

class _AddNewActivityFromDialogState extends State<AddNewActivityFromDialog> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const SizedBox(
            height: 100,
            child: Center(
              child: PrimaryLoadingIndicator(),
            ),
          )
        : Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              for (final String s in activityRecordValues.keys)
                if (widget.snapshot?.watering != null && s == 'সেচ রেকর্ড')
                  const SizedBox.shrink()
                else if (widget.snapshot?.sowing != null && s == 'বপন')
                  const SizedBox.shrink()
                else if (widget.snapshot?.fertilization != null &&
                    s == 'সার প্রদান')
                  const SizedBox.shrink()
                else if (widget.snapshot?.pesticide != null &&
                    s == 'কীটনাশক প্রদান')
                  const SizedBox.shrink()
                else if (widget.snapshot?.land_preparation != null &&
                    s == 'জমি তৈরী')
                  const SizedBox.shrink()
                else if (widget.snapshot?.sourcing != null &&
                    s == 'উৎপাদন রেকর্ড')
                  const SizedBox.shrink()
                else
                  FilterChip(
                    selectedColor: priceBoxColor,
                    label: Text(
                      s,
                    ),
                    onSelected: (bool isSelected) async {
                      debugPrint('selected: $isSelected');
                      if (isSelected) {
                        setState(() {
                          isLoading = true;
                        });
                        if (s == 'বপন') {
                          final harvAPI = HarvestAPI();
                          final prods = await harvAPI.getKrishProd();
                          // RecordSowingActivity
                          await Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => RecordSowingActivity(
                                recordName: s,
                                krishibebshaProd: prods,
                                batchID: widget.batchID,
                                units: localUnits ,
                              ),
                            ),
                          );
                        } else {
                          await Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => RecordSowingActivity(
                                recordName: s,
                                krishibebshaProd: const [],
                                batchID: widget.batchID,
                                units: const [],
                              ),
                            ),
                          );
                        }
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    // selected: _activityTypes.contains(s),
                  ),
            ],
          );
  }
}
