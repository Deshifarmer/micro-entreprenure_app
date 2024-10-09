import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class GroupLeaderCard extends StatelessWidget {
  const GroupLeaderCard({
    required this.image,
    required this.title,
    super.key,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 3,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: 
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                backgroundImage: NetworkImage(
                  checkDomain(
                    Strings.getServerOrLocal(
                      ServerOrLocal.server,
                    ),
                  )
                      ? dummyImage
                      : image,
                ),
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
