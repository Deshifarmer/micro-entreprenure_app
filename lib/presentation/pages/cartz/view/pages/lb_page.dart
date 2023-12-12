import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/cartz/components/lb_box.dart';
import 'package:deshifarmer/presentation/pages/cartz/components/lb_box2.dart';
import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';

class LonkaBanglaPage extends StatefulWidget {
  const LonkaBanglaPage({required this.fm, super.key});
  final FarmerEntity fm;

  @override
  State<LonkaBanglaPage> createState() => _LonkaBanglaPageState();
}

class _LonkaBanglaPageState extends State<LonkaBanglaPage> {
  int steps = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(25),
        ),
        child: ListView(
          // shrinkWrap: true,
          children: [
            Text(
              'BNPL - Lanka Bangla',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('''
BNPL  এর মাধ্যমে কৃষক সহজেই প্রোডাক্ট কিনতে পারবে যা ফসল উৎপাদনের সময়কালে সুবিধামতো পেমেন্ট দিয়ে দিতে পারবে নিকটস্থ দেশিফার্মার পয়েন্টে কিংবা সরাসরি পার্টনার এর ব্যাংক একাউন্টএ 
                    '''),
            ),
            Text(
              'কতটা ধাপে পরিশোধ করতে চাচ্ছেন ?',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(80),
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  index += 1;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        steps = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(5),
                      ),

                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      // padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: index == steps
                            ? primaryColor
                            : const Color(0xffb1e4b0),
                        // borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.circle,
                      ),
                      child: Text('$index'),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'লোন পেমেন্ট  কন্ফার্ম করুন',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 25,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'ফসল উৎপাদন সময় শুরু',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            const LBPaymentBox(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            LBBox2(
              times: steps,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child:
            SecondayButtonGreen(onpress: () {}, title: 'অর্ডার কন্ফার্ম করুন'),
      ),
    );
  }
}
