import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
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
    required this.allFarmerListResp,
    super.key,
  });

  // final AllFarmerListResp? allFarmerListResp;
  final FarmerEntity allFarmerListResp;
  final List<SingleCropEntity> crops;
  final List<UnitEntity> units;

  @override
  State<HarvestRecordPage2> createState() => _HarvestRecordPage2State();
}

class _HarvestRecordPage2State extends State<HarvestRecordPage2> {
  /// for the landsize
  final TextEditingController marketNameController = TextEditingController();

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

  final TextEditingController noteController = TextEditingController();

  final TextEditingController imageFieldController = TextEditingController();

  String sowingSeedsource = '';

  Future<void> _postHarvest() async {
    // debugPrint every field field of harvest model
    debugPrint('name -> ${widget.allFarmerListResp.farmer_id}');
    debugPrint('image -> ${imageFieldController.text}');
    // debugPrint('note -> ${noteController.text}');
    debugPrint('price -> ${sellPriceController.text}');
    debugPrint('quantity -> ${selectQuantityController.text}');
    debugPrint(
      'unit -> ${unitController.text.isEmpty ? widget.units.first.unit : unitController.text}',
    );
    debugPrint('crop -> ${selectCropController.text}');
    debugPrint('location -> ${sellLocationController.text}');

    if (sellPriceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ক্রয় মূল্য লিখুন'),
        ),
      );
      return;
    } else if (marketNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('বাজারের নাম লিখুন'),
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
    }

    setState(() {
      isLoading = true;
    });
    final harvestModel = HarvestModel(
      jatt: jatController.text.isEmpty ? '' : jatController.text,
      name: widget.allFarmerListResp.farmer_id ?? '',
      marketName:
          marketNameController.text.isEmpty ? '' : marketNameController.text,
      image: imageFieldController.text,
      note: noteController.text.isEmpty ? '' : noteController.text,
      price: sellPriceController.text,
      quantity: selectQuantityController.text,
      unit: unitController.text.isEmpty
          ? widget.units.first.unit
          : unitController.text,
      crop: selectCropController.text,
      location: sellLocationController.text,
    );
    final api = HarvestAPI();
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';

    await api.postHarvest(hm: harvestModel, token: token).then((value) {
      if (value.$1) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: primaryColor,
            content: Text('সফলভাবে সাবমিট হয়েছে'),
          ),
        );
        Navigator.pop(context);
        Navigator.pop(context);
        setState(() {
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('সাবমিট হয়নি  ${value.$2}}'),
          ),
        );
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  FarmerEntity? searchedValue;
  final TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    // selectFarmerController.dispose();
    selectCropController.dispose();
    selectQuantityController.dispose();
    unitController.dispose();
    jatController.dispose();
    sellPriceController.dispose();
    sellLocationController.dispose();
    noteController.dispose();
    imageFieldController.dispose();
    super.dispose();
  }

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
                    'নির্বাচিত কৃষক',
                  ),
                  //* select farmer
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${widget.allFarmerListResp.image}',
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
                          widget.allFarmerListResp.full_name ?? '',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        if (widget.allFarmerListResp.phone != null)
                          if (widget.allFarmerListResp.phone!.isNotEmpty)
                            Text(
                              ' (${widget.allFarmerListResp.phone})',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                      ],
                    ),
                  )
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
              child: Text('বাজারের নাম'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: marketNameController,
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
                      DropdownButtonFormField<UnitEntity>(
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
                            .map<DropdownMenuItem<UnitEntity>>((value) {
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
                            unitController.text = val.unit;
                          }
                        },
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
      bottomNavigationBar: isLoading
          ? const Center(child: PrimaryLoadingIndicator())
          : SecondayButtonGreen(
              btnColor: priceBoxColor,
              onpress: _postHarvest,
              // onpress: () {
              //   debugPrint('name -> ${selectFarmerController.text}');
              // },
              title: 'সাবমিট করুন ',
            ),
    );
  }
}
