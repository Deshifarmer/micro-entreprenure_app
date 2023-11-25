import 'package:deshifarmer/presentation/pages/finance_page/pages/finance_page3.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class FinancePage2 extends StatelessWidget {
  const FinancePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request finance'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'load request',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'BDT 24000',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'interest 11%',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    '1000',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total payment amount ',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'BDT 34000',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(25 + 10),
            ),
            Text(
              'I want to pay at a time',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
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
                  hintText: 'Payment date',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Text(
              'note: select within your harvest period for approval',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(25 + 5),
            ),
            Text(
              'I want to do a split payment',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Text(
              'select number of split during your crop harvest period',
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
                    margin: EdgeInsets.only(
                      right: getProportionateScreenWidth(40),
                      // vertical: getProportionateScreenHeight(5),
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
            Text(
              'note : select within your harvest period for approval and our system will check your crop intensity automatically',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SecondayButtonGreen(
          onpress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FinancePage3(),
              ),
            );
          },
          title: 'continue to schedule payment'),
    );
  }
}
