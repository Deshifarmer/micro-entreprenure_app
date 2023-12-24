import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HarvestCard extends StatelessWidget {
  const HarvestCard({
    required this.name,
    required this.farmerName,
    required this.farmerID,
    required this.image,
    required this.qt,
    required this.unit,
    required this.date,
    required this.soldPrice,
    super.key,
  });
  final String name;
  final String? image;
  final String farmerName;
  final String farmerID;
  final String qt;
  final String unit;
  final String date;
  final String? soldPrice;

  @override
  Widget build(BuildContext context) {
    // format the date time like (17 Oct, 2023) using intl package
    final formattedDate =
        DateFormat('dd MMM, yyyy').format(DateTime.parse(date));
    debugPrint('${Strings.getServerOrLocal(ServerOrLocal.server)}$image');
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                //* THE IMAGE
                Container(
                  height: getProportionateScreenHeight(90),
                  width: getProportionateScreenWidth(90),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${Strings.getServerOrLocal(ServerOrLocal.server)}$image',
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //* Name, farmer name + farmer id, date
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: titleFontLarge,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '$farmerName #$farmerID',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          formattedDate,
                          style: const TextStyle(
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
            //* Quantity + unit and sold
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(bottom: 10),
            //       child: Text(
            //         '$qt $unit',
            //         style: const TextStyle(
            //           fontSize: titleFont,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
          // sold
        ),
        Positioned(
          top: 10,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              '$qt $unit',
              style: const TextStyle(
                fontSize: titleFont,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        if (soldPrice != null)
          Positioned(
            bottom: -10,
            right: 0,
            child: Chip(
              backgroundColor: priceBoxColor,
              avatar: const Icon(
                Icons.playlist_add_check_outlined,
                color: Colors.white,
              ),
              // labelPadding: EdgeInsets.all(0),
              label: Text(
                'বিক্রিত',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
