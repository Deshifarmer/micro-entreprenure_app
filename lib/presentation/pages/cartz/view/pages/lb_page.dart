import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class LonkaBanglaPage extends StatelessWidget {
  const LonkaBanglaPage({required this.fm, super.key});
  final FarmerEntity fm;

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
              // color: Colors.black87,
              // margin: const EdgeInsets.all(8),
              // padding: const EdgeInsets.all(8),
              height: getProportionateScreenHeight(80),
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(5),
                    ),

                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    // padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xffb1e4b0),
                      // borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.circle,
                    ),
                    child: Text('${index + 1}'),
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'মোট',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                      Text(
                        '৳ 2000',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ইন্টারেস্ট  - 9 %',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                      Text(
                        '৳ 220',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'প্লাটফর্ম ফি',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                      Text(
                        '৳ 60',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'সর্বমোট',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        '৳ 2280',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(50),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'এখন',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        'Nothing to pay',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < 3; i++)
                    Container(
                      padding: const EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(5),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.query_builder,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'After 13  week',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '৳ 760',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
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
