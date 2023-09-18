import 'package:flutter/material.dart';

class OrderdetailCard extends StatelessWidget {
  const OrderdetailCard({
    required this.delevaryLocation,
    super.key,
  });

  final String delevaryLocation;

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
              Row(
                children: [
                  Icon(
                    Icons.flight_takeoff,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'ডেলিভারি তথ্য',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.info,
                      size: 8,
                    ),
                  ),
                  Text(
                    'কোনো ট্র্যাকিং কোড পাওয়া যায়নি',
                    // 'no tracking code found',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.loyalty,
                size: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'স্ট্যান্ডার্ড স্থানীয়',
                  // 'Standard Local',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              const Icon(
                Icons.room,
                size: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  // top: 10,
                  left: 10,
                ),
                child: Text(
                  delevaryLocation,
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
