import 'package:deshifarmer/presentation/pages/activity/api/harvest_api.dart';
import 'package:deshifarmer/presentation/pages/harvest/model/harvest_model.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class SumbitButtonForHervest extends StatefulWidget {
  const SumbitButtonForHervest({
    // required this.batchID,
    required this.harvestModel,
    // required this.onPressed,
    super.key,
  });
  final HarvestModel harvestModel;
  // final Function onPressed;
  @override
  State<SumbitButtonForHervest> createState() => _SumbitButtonForHervestState();
}

class _SumbitButtonForHervestState extends State<SumbitButtonForHervest> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // debugPrint('file path is -> ${widget.harvestModel.image}');
    return isLoading
        ? const Center(child: PrimaryLoadingIndicator())
        : SecondayButtonGreen(
            btnColor: priceBoxColor,
            onpress: () async {
              // debugPrint every field field of harvest model
              debugPrint('name -> ${widget.harvestModel.name}');
              debugPrint('image -> ${widget.harvestModel.image}');
              debugPrint('note -> ${widget.harvestModel.note}');
              debugPrint('price -> ${widget.harvestModel.price}');
              debugPrint('quantity -> ${widget.harvestModel.quantity}');
              debugPrint('unit -> ${widget.harvestModel.unit}');
              debugPrint('crop -> ${widget.harvestModel.crop}');
              debugPrint('location -> ${widget.harvestModel.location}');
              debugPrint('jatt -> ${widget.harvestModel.jatt}');

              if (widget.harvestModel.name.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('কৃষক নির্বাচন করুন'),
                  ),
                );
                return;
              } else if (widget.harvestModel.image.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ছবি আপলোড করুন'),
                  ),
                );
                return;
              } else if (widget.harvestModel.note.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('নোট লিখুন'),
                  ),
                );
                return;
              } else if (widget.harvestModel.price.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ক্রয় মূল্য লিখুন'),
                  ),
                );
                return;
              } else if (widget.harvestModel.quantity.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('পরিমাণ লিখুন'),
                  ),
                );
                return;
              } else if (widget.harvestModel.crop.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ফসল নির্বাচন করুন'),
                  ),
                );
                return;
              } else if (widget.harvestModel.location.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('উপজেলা নির্বাচন করুন'),
                  ),
                );
                return;
              } else if (widget.harvestModel.jatt.isEmpty) {
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
              final api = HarvestAPI();
              final loginState = context.read<LoginBloc>().state;
              final token = loginState is LoginSuccess
                  ? loginState.successLoginEntity.token
                  : '';
              final isCreated =
                  await api.postHarvest(hm: widget.harvestModel, token: token);

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
                    content: Text('সাবমিট হয়নি ${isCreated.$2}'),
                  ),
                );
              }
              setState(() {
                isLoading = false;
              });
            },
            title: 'সাবমিট করুন ',
          );
  }
}
