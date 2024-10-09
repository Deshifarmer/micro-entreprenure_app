import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/entity/unit_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/harvest_api.dart';
import 'package:deshifarmer/presentation/pages/harvest/components/get_image_for_harvest.dart';
import 'package:deshifarmer/presentation/pages/harvest/components/harvest_location_field.dart';
import 'package:deshifarmer/presentation/pages/harvest/model/harvest_model.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class HarvestRecordPage2 extends StatefulWidget {
  const HarvestRecordPage2({
    required this.crops,
    required this.units,
    this.allFarmerListResp,
    super.key,
  });

  final AllFarmerListRespEntity? allFarmerListResp;
  final List<String> crops;
  final List<String> units;

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
  bool isLoading = false;

  /// company
  final TextEditingController sellLocationController = TextEditingController();
  final TextEditingController sellLocationNameController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  final TextEditingController imageFieldController = TextEditingController();

  String sowingSeedsource = '';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                style: textTheme.titleMedium!.copyWith(
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

            ///select farmer
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
                    hint: const Text('কৃষক নির্বাচন করুন'),
                    elevation: 16,
                    // value: snapshot.data?.farmers.first,
                    items: widget.allFarmerListResp?.data
                        .map<DropdownMenuItem<FarmerEntity>>((value) {
                      return DropdownMenuItem<FarmerEntity>(
                        alignment: Alignment.center,
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
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

            ///select crop
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
                 if (widget.crops.isEmpty) const SizedBox()
                 else DropdownButtonFormField<String>(
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
                    hint: const Text('ফসল নির্বাচন করুন'),
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: widget.crops
                        .toSet()
                        .toList()
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: value,
                        child: ListTile(
                          title: value == ''
                              ? const Text('')
                              : Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      // print('on pressed called');
                      if (val != null) {
                        selectCropController.text = val;
                      }
                    },
                  ),
                ],
              ),
            ),

            ///select varaity
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

            ///add quantity
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
                      const Text('পরিমানের ধরণ'),
                      if (widget.units.isEmpty) const SizedBox()
                      else DropdownButtonFormField<String?>(
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
                        value: widget.units.first,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        items: widget.units
                            .map<DropdownMenuItem<String>>((value) {
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

                    ],
                  ),
                ),
              ],
            ),

            ///pricing
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

            ///place of sale
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text('বিক্রির স্থান'),
            ),
            FarmerVillageAddressForHarvest(
              farmerDivisionController: sellLocationController,
              farmerUpozelaNameController: sellLocationNameController,
            ),
            //! note

            ///not about sale
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
                //textInputAction: TextInputAction.done,
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
            // IconButton(
            //   onPressed: () {
            //     // debugPrint every field field of harvest model
            //     debugPrint('name -> ${selectFarmerController.text}');
            //     debugPrint('image -> ${imageFieldController.text}');
            //     debugPrint('note -> ${noteController.text}');
            //     debugPrint('price -> ${sellPriceController.text}');
            //     debugPrint('quantity -> ${selectQuantityController.text}');
            //     debugPrint(
            //       'unit -> ${unitController.text.isEmpty ? widget.units.first.unit : unitController.text}',
            //     );
            //     debugPrint('crop -> ${selectCropController.text}');
            //     debugPrint('location -> ${sellLocationController.text}');
            //     debugPrint('jatt -> ${jatController.text}');
            //   },
            //   icon: const Icon(Icons.ad_units),
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: SumbitButtonForHervest(
      //   harvestModel: HarvestModel(
      //     jatt: jatController.text,
      //     name: selectFarmerController.text,
      //     image: imageFieldController.text,
      //     note: noteController.text,
      //     price: sellPriceController.text,
      //     quantity: selectQuantityController.text,
      // unit: unitController.text.isEmpty
      //     ? widget.units.first.unit
      //     : unitController.text,
      //     crop: selectCropController.text,
      //     location: sellLocationController.text,
      //   ),
      // ),
      bottomNavigationBar: isLoading
          ? const Center(child: PrimaryLoadingIndicator())
          : SecondayButtonGreen(
              btnColor: priceBoxColor,
              onpress: () async {
                // debugPrint every field field of harvest model
                debugPrint('name -> ${selectFarmerController.text}');
                debugPrint('image -> ${imageFieldController.text}');
                debugPrint('note -> ${noteController.text}');
                debugPrint('price -> ${sellPriceController.text}');
                debugPrint('quantity -> ${selectQuantityController.text}');
                debugPrint(
                  'unit -> ${unitController.text.isEmpty ? widget.units.first : unitController.text}',
                );
                debugPrint('crop -> ${selectCropController.text}');
                debugPrint('source location -> ${sellLocationNameController.text}');
                debugPrint('market name id -> ${sellLocationController.text}');
                debugPrint('jatt -> ${jatController.text}');

                if (selectFarmerController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('কৃষক নির্বাচন করুন'),
                    ),
                  );
                  return;
                }
                // else if (imageFieldController.text.isEmpty) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //       content: Text('ছবি আপলোড করুন'),
                //     ),
                //   );
                //   return;
                // }
                else if (noteController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('নোট লিখুন'),
                    ),
                  );
                  return;
                } else if (sellPriceController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ক্রয় মূল্য লিখুন'),
                    ),
                  );
                  return;
                } else if (selectQuantityController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('পরিমাণ লিখুন'),
                    ),
                  );
                  return;
                } else if (selectCropController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ফসল নির্বাচন করুন'),
                    ),
                  );
                  return;
                } else if (sellLocationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('উপজেলা নির্বাচন করুন'),
                    ),
                  );
                  return;
                } else if (jatController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('জাত নির্বাচন করুন'),
                    ),
                  );
                  return;
                }
                setState(() {
                  isLoading = true;
                });
                final harvestModel = HarvestModel(
                  jatt: jatController.text,
                  name: selectFarmerController.text,
                  image: imageFieldController.text,
                  note: noteController.text,
                  price: sellPriceController.text,
                  quantity: selectQuantityController.text,
                  unit: unitController.text.isEmpty
                      ? widget.units.first
                      : unitController.text,
                  crop: selectCropController.text,
                  location: sellLocationController.text,
                );
                final api = HarvestAPI();
                final loginState = context.read<LoginBloc>().state;
                final token = loginState is LoginSuccess
                    ? loginState.successLoginEntity.token
                    : '';
                final isCreated =
                    await api.postHarvest(hm: harvestModel, token: token);

                if (isCreated.$1) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('সফলভাবে সাবমিট হয়েছে'),
                    ),
                  );
                  Navigator.pop(context);
                  // clear all the fields and pop
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('সাবমিট হয়নি  ${isCreated.$2}}'),
                    ),
                  );
                }
                setState(() {
                  isLoading = false;
                });
              },
              title: 'সাবমিট করুন ',
            ),
    );
  }
}
