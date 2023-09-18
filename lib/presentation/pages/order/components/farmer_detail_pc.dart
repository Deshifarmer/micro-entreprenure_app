import 'package:flutter/material.dart';

class FarmerDetailCardForOrderDetail extends StatelessWidget {
  const FarmerDetailCardForOrderDetail({
    required this.farmerName,
    required this.farmerPhone,
    super.key,
  });

  final String farmerName;
  final String farmerPhone;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // delevary info
          const Row(
            children: [
              Icon(
                Icons.calendar_view_day,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'কৃষকের তথ্য',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  farmerName,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),

          Row(
            children: [
              const Icon(
                Icons.phone,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  // top: 10,
                  left: 10,
                ),
                child: Text(
                  farmerPhone,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
