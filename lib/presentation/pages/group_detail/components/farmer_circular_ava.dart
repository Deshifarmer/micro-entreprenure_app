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
                ? Image.network(
                    checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
                        ? dummyImage
                        : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/$image',
                    // : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${state.groupDetailEntity.group_leader?.image}',
                    height: 80,
                    width: 80,
                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return Center(
                        child: Text(
                          'Image Error',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.redAccent,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      );
                    },
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
