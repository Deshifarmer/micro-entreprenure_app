import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
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
    required this.onPressed,
    super.key,
  });
  final HarvestModel harvestModel;
  final Function onPressed;
  @override
  State<SumbitButtonForHervest> createState() => _SumbitButtonForHervestState();
}

class _SumbitButtonForHervestState extends State<SumbitButtonForHervest> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // print('file path is -> ${widget.harvestModel.image}');
    return isLoading
        ? const Center(child: PrimaryLoadingIndicator())
        : SecondayButtonGreen(
            btnColor: priceBoxColor,
            onpress: () async {
              // print every field field of harvest model
              print('name -> ${widget.harvestModel.name}');
              print('image -> ${widget.harvestModel.image}');
              print('note -> ${widget.harvestModel.note}');
              print('price -> ${widget.harvestModel.price}');
              print('quantity -> ${widget.harvestModel.quantity}');
              print('unit -> ${widget.harvestModel.unit}');
              print('crop -> ${widget.harvestModel.crop}');
              print('location -> ${widget.harvestModel.location}');
              print('jatt -> ${widget.harvestModel.jatt}');

              // show snack bar if any field is empty
              if (widget.harvestModel.name.isEmpty ||
                  widget.harvestModel.image.isEmpty ||
                  widget.harvestModel.note.isEmpty ||
                  widget.harvestModel.price.isEmpty ||
                  widget.harvestModel.quantity.isEmpty ||
                  widget.harvestModel.unit.isEmpty ||
                  widget.harvestModel.crop.isEmpty ||
                  widget.harvestModel.location.isEmpty ||
                  widget.harvestModel.jatt.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('সব ঘর পূরণ করুন'),
                  ),
                );
                return;
              }
              setState(() {
                isLoading = true;
              });
              final api = DeshiFarmerAPI();
              final loginState = context.read<LoginBloc>().state;
              final token = loginState is LoginSuccess
                  ? loginState.successLoginEntity.token
                  : '';
              final isCreated =
                  await api.postHarvest(hm: widget.harvestModel, token: token);

              if (isCreated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('সফলভাবে সাবমিট হয়েছে'),
                  ),
                );
                // clear all the fields and pop
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('সাবমিট হয়নি'),
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
