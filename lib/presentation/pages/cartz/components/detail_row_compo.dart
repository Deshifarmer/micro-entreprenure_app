import 'package:flutter/material.dart';

class DetailRowConformCompo extends StatelessWidget {
  const DetailRowConformCompo({
    required this.field,
    required this.value,
    super.key,
  });

  final String field;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            field,
          ),
          // if (userProfile is UserProfileFetchSuccess)
          Text(value),
        ],
      ),
    );
  }
}
