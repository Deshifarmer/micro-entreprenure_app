import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class SelectCropharvest extends StatelessWidget {
  const SelectCropharvest({
    required this.selectCropController,
    super.key,
  });

  final TextEditingController selectCropController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SingleCropEntity>>(
      future: DeshiFarmerAPI().getCropFromAnotherAPI(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // add an empty crop to the list
          snapshot.data!.insert(
            0,
            const SingleCropEntity(
              name: '',
            ),
          );
          // show a dropdown
          return DropdownButtonFormField<SingleCropEntity>(
            isDense: false,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            isExpanded: true,
            decoration: InputDecoration(
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
            // decoration: ShapeDecoration(),
            // itemHeight: 300,
            elevation: 16,
            value: snapshot.data!.isNotEmpty ? snapshot.data!.first : null,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            items:
                snapshot.data!.map<DropdownMenuItem<SingleCropEntity>>((value) {
              return DropdownMenuItem<SingleCropEntity>(
                alignment: Alignment.center,
                value: value,
                child: ListTile(
                  title: value.name == '' ? const Text('') : Text(value.name),
                ),
              );
            }).toList(),
            onChanged: (SingleCropEntity? val) {
              // print('on pressed called');
              if (val != null) {
                selectCropController.text = val.name;
              }
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
