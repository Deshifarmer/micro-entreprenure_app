import 'package:deshifarmer/presentation/shapes/car_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/logistic/bloc/bloc.dart';

/// {@template logistic_body}
/// Body of the LogisticPage.
///
/// Add what it does
/// {@endtemplate}
class LogisticBody extends StatelessWidget {
  /// {@macro logistic_body}
  const LogisticBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'লজিস্টিকস',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
              // CustomPaint(
              //   painter: CarShape(),
              //   size: Size(100, 100),
              // ),
              Icon(
                Icons.time_to_leave,
                size: 100,
                color: primaryColor,
              ),
            ],
          ),

          /// a test
//           Text(
//             '''You can order logistic support from deshifarmer
// logistic vendors to send fresh produces to warehouse,
// market or locals.''',
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
          Text(
            '''আপনার তাজা পণ্য ওয়্যারহাউজ/মার্কেট/লোকাল এ পাঠানোর জন্যে দেশীফর্মারের লজিস্টিক ভেন্ডর এর সাহায্য নিতে পারবেন''',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),

          /// a sizedbox
          SizedBox(
            height: getProportionateScreenHeight(100),
          ),

          /// a from
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'থেকে',
                // hintText: 'from',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'প্রতি',
                // hintText: 'to',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'গাড়ির ধরন নির্বাচন করুন',
                // hintText: 'select vehicle type',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'উৎপাদিত ওজন',
                // hintText: 'weight of produces',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),

          SecondayButtonGreen(onpress: () {}, title: 'রিকোয়েস্ট দিন'),
          SizedBox(
            height: getProportionateScreenHeight(60),
          ),

          /// a list of todays pricing
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'আজকের গড় মূল্য',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Bogra',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                'to',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                'Dhaka',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '৳ 17500/',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: '1.5 ton truck',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
