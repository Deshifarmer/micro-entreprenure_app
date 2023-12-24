import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class FarmerCircularAvater extends StatelessWidget {
  const FarmerCircularAvater({
    required this.image,
    required this.name,
    super.key,
  });

  final String name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: image != null
                ? CachedNetworkImage(
                   imageUrl:  checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
                        ? dummyImage
                        : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/$image',
                    // : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${state.groupDetailEntity.group_leader?.image}',
                    height: 80,
                    width: 80,
                    progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                          color: Colors.green[600],
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                  )
                : const CircleAvatar(radius: 40),
          ),
          Expanded(
            child: Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
