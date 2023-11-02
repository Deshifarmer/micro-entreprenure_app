import 'package:deshifarmer/presentation/pages/crop_insurance/components/request_insurance_paginate.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class MyRequestCropInsurance extends StatelessWidget {
  const MyRequestCropInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Text(
              'আমার ইন্সুরেন্স রিকোয়েস্ট সমূহ ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            /* ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '23 mar, 23',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '#23-fas-234s',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'pending',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '23 mar, 23',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          '#23-fas-234s',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ), */
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3.0,
            ),
            const Center(child: Text('কোন ইন্সুরেন্স পাওয়া যায়নি')),
          ],
        ),
      ),

      // bottomNavigationBar: OpenContainer(
      //   openColor: backgroundColor2,
      //   closedColor: backgroundColor2,
      //   openBuilder: (context, action) => const RequestCropInsurance(),
      //   closedBuilder: (context, action) {
      //     return SecondayButtonGreen(
      //       onpress: action,
      //       title: 'ইন্সুরেন্স রিকোয়েস্ট দিন ',
      //       // title: 'Add New Request',
      //     );
      //   },
      // ),
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) => const SelectFarmerPaginateReqInsurance(),
          );
        },
        title: 'ইন্সুরেন্স রিকোয়েস্ট দিন ',
        // title: 'Add New Request',
      ),
    );
  }
}
