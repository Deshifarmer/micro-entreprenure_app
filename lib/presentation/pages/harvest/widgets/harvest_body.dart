import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

/// {@template harvest_body}
/// Body of the HarvestPage.
///
/// Add what it does
/// {@endtemplate}
class HarvestBody extends StatelessWidget {
  /// {@macro harvest_body}
  const HarvestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'উৎপাদনের তালিকা ',
              style: TextStyle(
                fontSize: titleFont,
                fontWeight: FontWeight.w600,
                color: priceBoxColor,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('কিছুই পাওয়া যায়নি')),
          ),

          ///TODO: item
          /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Potato',
                            style: TextStyle(
                              fontSize: titleFontLarge,
                              fontWeight: FontWeight.w600,
                            )),
                        Text(
                          'Farmer name, id',
                          style: TextStyle(
                            fontSize: smallFont,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            '26 Oct, 2023',
                            style: TextStyle(
                              fontSize: smallFont,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      '500 kg',
                      style: TextStyle(
                        fontSize: titleFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: priceBoxColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.playlist_add_check,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Text(
                            'বিক্রিত ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ), */
        ],
      ),
    );
  }
}
