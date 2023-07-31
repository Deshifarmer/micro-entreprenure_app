import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';

/// {@template add_farmer_body}
/// Body of the AddFarmerPage.
///
/// Add what it does
/// {@endtemplate}
class AddFarmerBody extends StatelessWidget {
  /// {@macro add_farmer_body}
  const AddFarmerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFarmerBloc, AddFarmerState>(
      builder: (context, state) {
        return ListView(
          children: [
            /// first name
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'নামের প্রথম অংশ',
                  hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* last name
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'নামের শেষ অংশ',
                  hintText: 'কৃষকের নামের শেষ অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* picture upload
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কৃষক এর ছবি',
                  hintText: 'কৃষক এর ছবি আপলোড করুন',
                  filled: true,
                ),
              ),
            ),

            ///* dob
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: TextFormField(
            //     keyboardType: TextInputType.datetime,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'কৃষকের জন্ম তারিখ',
            //       // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
            //       filled: true,
            //     ),
            //   ),
            // ),
            ElevatedButton(
                onPressed: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1880),
                    lastDate: DateTime.now(),
                  );
                },
                child: Text('DOB')),

            ///* phone
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কৃষকের ফোন নম্বর',
                  hintText: 'কৃষকের ফোন নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* nid
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কৃষকের এনআইডি নম্বর',
                  hintText: 'কৃষকের এনআইডি নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* gender
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কৃষকটি ছেলে / মেয়ে ?',
                  hintText: 'কৃষকের এনআইডি নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* division select
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'বিভাগ নির্বাচন করুন',
                  // hintText: 'কৃষকের এনআইডি নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* dist select
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'জেলা নির্বাচন করুন',
                  // hintText: 'কৃষকের এনআইডি নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* sub dist select
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'উপজেলা নির্বাচন করুন',
                  // hintText: 'কৃষকের এনআইডি নম্বর লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* union
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ইউনিয়ন',
                  // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* village name
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'গ্রামের নাম',
                  // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* address
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ঠিকানা',
                  // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                  filled: true,
                ),
              ),
            ),

            ///* family members
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কৃষকের পরিবারের সদস্য সংখ্যা',
                  filled: true,
                ),
              ),
            ),

            ///* childrens
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'সন্তান সংখ্যা',
                  filled: true,
                ),
              ),
            ),

            ///* yearly income
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কৃষকের বার্ষিক আয়',
                  filled: true,
                ),
              ),
            ),

            ///* how long is he/she living there
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কত বছর ধরে বসবাস করছে',
                  filled: true,
                ),
              ),
            ),

            ///* farmar id (leave blank)
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'সরকারি কৃষক আইডি (না থাকলে ফাকা রাখুন)',
                  filled: true,
                ),
              ),
            ),

            ///* father's name (farmar)
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'কৃষকের পিতার নাম',
                  filled: true,
                ),
              ),
            ),

            ///* relational status
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'বৈবাহিক অবস্থা',
                  filled: true,
                ),
              ),
            ),

            ///* living house type (own/rantal)
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'বাসস্থানের অবস্থা নির্বাচন করুন',
                  filled: true,
                ),
              ),
            ),

            ///* land type
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'জমির ধরণ নির্বাচন করুন',
                  filled: true,
                ),
              ),
            ),

            ///* land messure
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'জমির পরিমাণ',
                  filled: true,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
