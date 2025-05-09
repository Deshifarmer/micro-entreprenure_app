import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/logistic/api/logistic_api.dart';
import 'package:deshifarmer/presentation/pages/logistic/model/logistic_model.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// {@template logistic_body}
/// Body of the LogisticPage.
///
/// Add what it does
/// {@endtemplate}
class LogisticBody extends StatefulWidget {
  /// {@macro logistic_body}
  const LogisticBody({super.key});

  @override
  State<LogisticBody> createState() => _LogisticBodyState();
}

class _LogisticBodyState extends State<LogisticBody> {
  final toController = TextEditingController();

  final fromController = TextEditingController();

  final vehicleTypeController = TextEditingController();

  final weightController = TextEditingController();
  String? selectedUnit;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: ListView(
        children: [
          const Row(
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
          const Text(
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

          ///! from
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: fromController,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'শুরুর স্থান',
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
          //! a to
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: toController,
              decoration: const InputDecoration(
                // fillColor: backgroundColor2,
                hintText: 'গন্তব্য স্থান',
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
          //! a vehicle type
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: vehicleTypeController,
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
          //! a weight
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                // a dropdown in suffix
                suffixIcon: PopupMenuButton(
                  itemBuilder: (context) => localUnits
                      .map(
                        (e) => PopupMenuItem(
                          value: e,
                          child: Text(e.unit),
                          onTap: () {
                            setState(() {
                              selectedUnit = e.unit;
                            });
                          },
                        ),
                      )
                      .toList(),
                  icon: Text(
                    selectedUnit != null ? selectedUnit! : 'ইউনিট',
                    // 'unit',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),

                // fillColor: backgroundColor2,
                hintText: 'উৎপাদিত ওজন',
                // hintText: 'weight of produces',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 15,
                ),
                filled: true,
              ),
            ),
          ),
          SecondayButtonGreen(
            onpress: () async {
              // none of the field can be empty
              if (fromController.text.isEmpty ||
                  toController.text.isEmpty ||
                  vehicleTypeController.text.isEmpty ||
                  weightController.text.isEmpty) {
                // show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('সব ঘর পূরণ করুন'),
                    // content: Text('fill all the fields'),
                  ),
                );
                return;
              } else if (selectedUnit == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('ইউনিট নির্বাচন করুন'),
                    // content: Text('fill all the fields'),
                  ),
                );
                return;
              }
              final lm = LogisticModel(
                from: fromController.text,
                to: toController.text,
                trackType: vehicleTypeController.text,
                weight: '${weightController.text} $selectedUnit}',
              );
              debugPrint(
                {
                  'from': fromController.text,
                  'to': toController.text,
                  'vehicle_type': vehicleTypeController.text,
                  'weight': '${weightController.text} $selectedUnit}',
                }.toString(),
              );
              final loginState = context.read<LoginBloc>().state;
              final token = loginState is LoginSuccess
                  ? loginState.successLoginEntity.token
                  : '';
              final postLogistic = LogisticAPI();
              final result = await postLogistic.postLogistic(
                lm: lm,
                token: token,
              );
              if (result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('সফলভাবে সাবমিট হয়েছে'),
                    // content: Text('fill all the fields'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('সাবমিট হয়নি'),
                    // content: Text('fill all the fields'),
                  ),
                );
              }
            },
            title: 'রিকোয়েস্ট দিন',
          ),
          SizedBox(
            height: getProportionateScreenHeight(60),
          ),

          /// a list of todays pricing

          // const Padding(
          //   padding: EdgeInsets.only(bottom: 10),
          //   child: Text(
          //     'আজকের গড় মূল্য',
          //     style: TextStyle(
          //       fontSize: 16,
          //       fontWeight: FontWeight.w600,
          //     ),
          //   ),
          // ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     const Text(
          //       'Bogra',
          //       style: TextStyle(
          //         fontSize: 13,
          //       ),
          //     ),
          //     const Text(
          //       'to',
          //       style: TextStyle(
          //         fontSize: 10,
          //       ),
          //     ),
          //     const Text(
          //       'Dhaka',
          //       style: TextStyle(
          //         fontSize: 13,
          //       ),
          //     ),
          //     RichText(
          //       text: const TextSpan(
          //         text: '৳ 17500/',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w400,
          //           color: Colors.black,
          //         ),
          //         children: [
          //           TextSpan(
          //             text: '1.5 ton truck',
          //             style: TextStyle(
          //               fontSize: 10,
          //               fontWeight: FontWeight.w400,
          //               color: Colors.black,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

class ShowLogistics extends StatelessWidget {
  const ShowLogistics({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView();
    /*

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Bogra',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              const Text(
                'to',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              const Text(
                'Dhaka',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              RichText(
                text: const TextSpan(
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
    */
  }
}
