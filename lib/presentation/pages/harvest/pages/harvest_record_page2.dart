import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/harvest/components/crop_lsit_view_harvest.dart';
import 'package:deshifarmer/presentation/pages/harvest/components/get_image_for_harvest.dart';
import 'package:deshifarmer/presentation/pages/harvest/components/harvest_location_field.dart';
import 'package:deshifarmer/presentation/pages/harvest/components/select_farmer_with_exceptionh.dart';
import 'package:deshifarmer/presentation/pages/harvest/model/harvest_model.dart';
import 'package:deshifarmer/presentation/pages/harvest/pages/submit_button.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

const List<String> units = <String>[
  'KG',
  'Ton',
  'Mon',
  'PSC',
  'Ati',
  'Palla',
];

class HarvestRecordPage2 extends StatefulWidget {
  const HarvestRecordPage2({
    required this.crops,
    this.allFarmerListResp,
    super.key,
  });

  final AllFarmerListResp? allFarmerListResp;
  final List<SingleCropEntity> crops;

  @override
  State<HarvestRecordPage2> createState() => _HarvestRecordPage2State();
}

class _HarvestRecordPage2State extends State<HarvestRecordPage2> {
  /// for the landsize
  final TextEditingController selectFarmerController = TextEditingController();

  /// chemial
  final TextEditingController selectCropController = TextEditingController();

  /// chemical company
  final TextEditingController selectQuantityController =
      TextEditingController();

  /// unit controller
  final TextEditingController unitController = TextEditingController();

  final TextEditingController jatController = TextEditingController();

  /// chemical  quanity
  final TextEditingController sellPriceController = TextEditingController();

  /// NOTE: sowing

  /// company
  final TextEditingController sellLocationController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  final TextEditingController imageFieldController = TextEditingController();

  String sowingSeedsource = '';

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    // print(
    //   'name -> ${widget.recordName} ${activityRecordValues[widget.recordName] == ActivityTypeEnums.landpref}',
    // );

    // final recordSowingState = context.read<RecordSowingBloc>().state;
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        surfaceTintColor: backgroundColor2,
        backgroundColor: backgroundColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          cacheExtent: 999999,
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'কাস্টম উৎপাদন রেকর্ড',
                // child: Text('Record Sowing',
                style: _textTheme.titleMedium!.copyWith(
                  color: priceBoxColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Row(
              children: [
                Icon(
                  Icons.room_outlined,
                  color: Colors.red,
                  size: 14,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Your location will be automatically captured while \nrecording an activity',
                      // 'Your location will be automatically captured while recording an activity',
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),

            //! dotteted border box for image
            SizedBox(
              height: getProportionateScreenHeight(150),
              width: double.infinity,
              child: GetImageForHarvest(
                selectIMGController: imageFieldController,
              ),
            ),
            //! select farmer
            // SelectFarmerMethodsForHarvest(
            //   selectFarmerController: selectFarmerController,
            // ),
            // SelectFarmerMethodsForHarvests(
            //     // selectFarmerController: selectFarmerController,
            //     ),
            // SelectFarmerMethodsForHarvests(
            //   selectFarmerController: selectFarmerController,
            // ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'কৃষক নির্বাচন করুন',
                  ),
                  DropdownButtonFormField<FarmerEntity>(
                    isExpanded: true,
                    // itemHeight: 300,
                    // menuMaxHeight: 200,

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
                      hintText: '',
                      filled: true,
                    ),
                    hint: Text('কৃষক নির্বাচন করুন'),
                    elevation: 16,
                    // value: snapshot.data?.farmers.first,
                    items: widget.allFarmerListResp?.farmers
                        .map<DropdownMenuItem<FarmerEntity>>((value) {
                      return DropdownMenuItem<FarmerEntity>(
                        alignment: Alignment.center,
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                value.full_name ?? '',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              if (value.phone != null)
                                if (value.phone!.isNotEmpty)
                                  Text(
                                    ' (${value.phone})',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (FarmerEntity? val) {
                      if (val != null) {
                        selectFarmerController.text = val.farmer_id ?? '';
                      }
                    },
                  ),
                ],
              ),
            ),
            //! select g
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('ফসল নির্বাচন করুন'),
                  ),
                  DropdownButtonFormField<SingleCropEntity>(
                    isDense: false,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    isExpanded: true,
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
                      hintText: '',
                      filled: true,
                    ),
                    // decoration: ShapeDecoration(),
                    // itemHeight: 300,
                    elevation: 16,
                    // value: snapshot.data!.isNotEmpty ? snapshot.data!.first : null,
                    hint: const Text('ফসল নির্বাচন করুন'),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: widget.crops
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<SingleCropEntity>>((value) {
                      return DropdownMenuItem<SingleCropEntity>(
                        alignment: Alignment.center,
                        value: value,
                        child: ListTile(
                          title: value.name == ''
                              ? const Text('')
                              : Text(value.name),
                        ),
                      );
                    }).toList(),
                    onChanged: (SingleCropEntity? val) {
                      // print('on pressed called');
                      if (val != null) {
                        selectCropController.text = val.name;
                      }
                    },
                  ),
                ],
              ),
            ),
            //! jatt
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text('জাত'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: jatController,
                // onTap: () async {},
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                  fillColor: backgroundColor2,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
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
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: '',
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
                          controller: selectQuantityController,
                          // onTap: () async {},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
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
                        child: DropdownButtonFormField<String>(
                          isDense: false,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          isExpanded: true,
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
                            hintText: '',
                            filled: true,
                          ),
                          // decoration: ShapeDecoration(),
                          // itemHeight: 300,
                          elevation: 16,
                          value: units.first,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          items: units.map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: value,
                              child: ListTile(
                                title: Text(value),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            // print('on pressed called');
                            if (val != null) {
                              unitController.text = val;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            //! price
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text('DF ক্রয় মূল্য ( টাকা )'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: sellPriceController,
                // onTap: () async {},
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                  fillColor: backgroundColor2,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
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
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: '',
                  filled: true,
                ),
              ),
            ),
            //! price
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text('বিক্রির স্থান'),
            ),
            FarmerVillageAddressForHarvest(
              farmerDivisionController: sellLocationController,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: TextField(
            //     controller: sellLocationController,
            //     // onTap: () async {},
            //     // keyboardType: TextInputType.none,
            //     decoration: InputDecoration(
            //       // suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
            //       fillColor: backgroundColor2,
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: const BorderRadius.all(Radius.circular(10)),
            //         borderSide: BorderSide(
            //           color: Colors.black.withOpacity(0.2),
            //         ),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: const BorderRadius.all(Radius.circular(10)),
            //         borderSide: BorderSide(
            //           color: Colors.black.withOpacity(0.2),
            //         ),
            //       ),
            //       border: OutlineInputBorder(
            //         borderRadius: const BorderRadius.all(Radius.circular(15)),
            //         borderSide: BorderSide(
            //           color: Colors.black.withOpacity(0.2),
            //         ),
            //       ),
            //       contentPadding: const EdgeInsets.symmetric(
            //         // vertical: 20,
            //         horizontal: 15,
            //       ),
            //       labelStyle: const TextStyle(
            //         color: Colors.black,
            //       ),
            //       hintText: '',
            //       filled: true,
            //     ),
            //   ),
            // ),
            //! note
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text('নোট'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: noteController,
                // onTap: () async {},
                // keyboardType: TextInputType.none,
                maxLines: 5,
                decoration: InputDecoration(
                  // suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
                  fillColor: backgroundColor2,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
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
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  hintText: '',
                  filled: true,
                ),
              ),
            ),
            // a sized box with the height of bottom navigation bar
            SizedBox(
              height: getProportionateScreenHeight(80),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SumbitButtonForHervest(
        harvestModel: HarvestModel(
          jatt: jatController.text,
          name: selectFarmerController.text,
          image: imageFieldController.text,
          note: noteController.text,
          price: sellPriceController.text,
          quantity: selectQuantityController.text,
          unit: unitController.text.isEmpty ? units.first : unitController.text,
          crop: selectCropController.text,
          location: sellLocationController.text,
        ),
        // onPressed: () {},
        // onpress: () async {
        //   final harvestModel = HarvestModel(
        //     jatt: jatController.text,
        //     name: selectFarmerController.text,
        //     image: imageFieldController.text,
        //     note: noteController.text,
        //     price: sellPriceController.text,
        //     quantity: selectQuantityController.text,
        //     unit:
        //         unitController.text.isEmpty ? units.first : unitController.text,
        //     crop: selectCropController.text,
        //     location: sellLocationController.text,
        //   );
        //   final api = DeshiFarmerAPI();
        //   final loginState = context.read<LoginBloc>().state;
        //   final token = loginState is LoginSuccess
        //       ? loginState.successLoginEntity.token
        //       : '';

        //   final isCreated =
        //       await api.postHarvest(hm: harvestModel, token: token);
        //   if (isCreated) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(
        //         content: Text('সফলভাবে সাবমিট হয়েছে'),
        //       ),
        //     );
        //     // clear all the fields and pop
        //     selectFarmerController.clear();
        //     selectCropController.clear();
        //     selectQuantityController.clear();
        //     unitController.clear();
        //     sellPriceController.clear();
        //     sellLocationController.clear();
        //     noteController.clear();
        //     imageFieldController.clear();
        //     jatController.clear();
        //     // Navigator.of(context).pop();

        //     // Navigator.of(context).pushReplacement(
        //     //   MaterialPageRoute(
        //     //     builder: (context) => const ActivityPage(),
        //     //   ),
        //     // );
        //   } else {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(
        //         content: Text('সাবমিট হয়নি'),
        //       ),
        //     );
        //   }

        //   // final fields = {
        //   //   'image': imageFieldController.text,
        //   //   'selectFarmer': selectFarmerController.text,
        //   //   'selectCrop': selectCropController.text,
        //   //   'selectQuantity': selectQuantityController.text,
        //   //   'unit':
        //   //       unitController.text.isEmpty ? units.first : unitController.text,
        //   //   'sellPrice': sellPriceController.text,
        //   //   'sellLocation': sellLocationController.text,
        //   //   'note': noteController.text,
        //   // };
        //   // print(fields.toString());
        // },
        // title: 'সাবমিট করুন ',
      ),
      // bottomNavigationBar: BottomButtonLoading(
      //   // batchID: widget.batchID,
      //   // whatType: activityRecordValues[widget.recordName]!,
      //   landSize: landprefSize.text,
      //   weedingDate: _weedingDate != null ? _weedingDate.toString() : '',
      //   landPreDate: _landprefDate.toString(),
      //   landChemical: landprefChemical.text,
      //   irrigatinDate:
      //       _irrigationDate != null ? _irrigationDate.toString() : '',
      //   sowingSeedDate: _sowingDate != null ? _sowingDate.toString() : '',
      //   sowingseedPrice: sowingSeedPrice.text,
      //   sowingSeedSource: sowingSeedsource,
      //   sowingSeedCompany: sowingSeedCompany.text,
      //   sowingSeedQuantity: sowingSeedQuantity.text,
      //   landChemicalCompany: landprefChemicalCompany.text,
      //   landChemicalQuantity: landprefChemicalQuantity.text,
      //   sowingExpectedHarvest: sowingExpectedHarvest.text,
      //   // farmID: widget.farmID,
      //   // farmerID: widget.farmerID,
      //   // activityTypes: widget.activityTypes,
      // ),
    );
  }
}

// class BottomButtonLoading extends StatefulWidget {
//   const BottomButtonLoading({
//     // required this.batchID,
//     // required this.whatType,
//     required this.sowingExpectedHarvest,
//     required this.sowingSeedDate,
//     required this.sowingSeedSource,
//     required this.sowingseedPrice,
//     required this.sowingSeedQuantity,
//     required this.sowingSeedCompany,
//     required this.landChemicalQuantity,
//     required this.landChemicalCompany,
//     required this.landChemical,
//     required this.landSize,
//     required this.irrigatinDate,
//     required this.weedingDate,
//     required this.landPreDate,
//     // required this.activityTypes,
//     // required this.ram,
//     // required this.farmID,
//     super.key,
//   });


//   @override
//   State<BottomButtonLoading> createState() => _BottomButtonLoadingState();
// }

// class _BottomButtonLoadingState extends State<BottomButtonLoading> {
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<RecordSowingBloc, RecordSowingState>(
//       listener: (context, state) {
//         if (state is RecordSowingSuccess || state is RecordSowingFailed) {
//           // print('failed or success');
//           setState(() {
//             isLoading = false;
//           });
//           if (state is RecordSowingLoading) {
//             // print('loading');
//             setState(() {
//               isLoading = true;
//             });
//           }
//         }
//       },
//       builder: (context, state) {
//         return isLoading
//             ? const Center(child: PrimaryLoadingIndicator())
//             : state is RecordSowingInitial
//                 ? SecondayButtonGreen(
//                     btnColor: priceBoxColor,
//                     onpress: () async {
//                       setState(() {
//                         isLoading = true;
//                       });
//                       final loginState = context.read<LoginBloc>().state;
//                       final userProfile = context.read<UserProfileBloc>().state;
//                       if (loginState is LoginSuccess &&
//                           userProfile is UserProfileFetchSuccess) {
                       
//                       }
//                     },
//                     title: 'সাবমিট করুন ',
//                   )
//                 : const SizedBox.shrink();
//       },
//     );
//   }
// }
