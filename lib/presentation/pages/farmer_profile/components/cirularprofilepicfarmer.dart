import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class FarmerCircularProfilePic extends StatelessWidget {
  const FarmerCircularProfilePic({
    required this.farmerProfilePage,
    super.key,
  });

  final FarmerEntity farmerProfilePage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
              ? dummyImage
              : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${farmerProfilePage.image}',
          height: 150,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              color: Colors.green[600],
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
