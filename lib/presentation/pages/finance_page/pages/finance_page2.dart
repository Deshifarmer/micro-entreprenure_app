import 'package:deshifarmer/presentation/pages/finance_page/models/fianance_model.dart';
import 'package:deshifarmer/presentation/pages/finance_page/pages/finance_page3.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FinancePage2 extends StatefulWidget {
  const FinancePage2({required this.fm, super.key, required this.ammount});

  final FinanceModel fm;
  final int ammount;

  @override
  State<FinancePage2> createState() => _FinancePage2State();
}

class _FinancePage2State extends State<FinancePage2> {
  bool isDateSelected = false;
  int splitPayment = 0;
  final TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  // get specific weekday from now
  String getSpecificDate(int weekday) {
    final now = DateTime.now();
    final date = now.add(Duration(days: 7 * weekday));

    return DateFormat('yyyy-MM-dd').format(date);
  }

  // get dates from every weekend from now
  List<String> getDates(int lastWeekdate) {
    final now = DateTime.now();
    final dates = <String>[];
    for (var i = 0; i < lastWeekdate; i++) {
      final date = now.add(Duration(days: 7 * i));
      dates.add(DateFormat('yyyy-MM-dd').format(date));
    }
    return dates;
  }

  @override
  void dispose() {
    dateinput.dispose();
    super.dispose();
  }

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
                  'BDT ${widget.ammount}',
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
                    '${widget.ammount * 11 / 100} ',
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
                  'BDT ${widget.ammount + (widget.ammount * 11 / 100)}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(25 + 10),
            ),
            //! date select
            ExpansionTile(
              title: Text(
                'I want to pay at a time',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    readOnly: true,
                    controller: dateinput,
                    onTap: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        // initialDate is 7 days from now
                        initialDate: DateTime.now().add(
                          const Duration(
                            days: 7,
                          ),
                        ), //DateTime.now(), //we use controller value as initial date from text field
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null) {
                        final formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          isDateSelected = true;
                          dateinput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
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
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(25 + 5),
            ),
            ExpansionTile(
              title: Text(
                'I want to do a split payment',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              children: [
                const Text(
                  'select number of split during your crop harvest period',
                ),
                SizedBox(
                  height: getProportionateScreenHeight(95),
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: isDateSelected ? 1 : 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            splitPayment = index + 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(
                                //   right: getProportionateScreenWidth(40),
                                //   // vertical: getProportionateScreenHeight(5),
                                // ),

                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                // padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: splitPayment == index + 1
                                      ? const Color.fromARGB(255, 24, 206, 21)
                                      : const Color(0xffb1e4b0),
                                  // borderRadius: BorderRadius.circular(20),
                                  shape: BoxShape.circle,
                                ),
                                child: Text('${index + 1}'),
                              ),
                              if (isDateSelected)
                                Text(dateinput.text)
                              else
                                Text(getSpecificDate(index)),
                            ],
                          ),
                        ),
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
          ],
        ),
      ),
      floatingActionButton: isDateSelected
          ? FloatingActionButton(
              backgroundColor: primaryColor,
              onPressed: () {
                setState(() {
                  isDateSelected = false;
                  dateinput.text = '';
                });
              },
              child: const Icon(Icons.clear_all_outlined),
            )
          : null,
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () {
          debugPrint('split payment: ${splitPayment == 0 ? 0 : splitPayment}');
          debugPrint('date: ${dateinput.text}');
          if (splitPayment == 0 && dateinput.text.isEmpty) {
            return;
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FinancePage3(
                fm: widget.fm,
                lastWeekdate: splitPayment == 0 ? 0 : splitPayment,
                dates: splitPayment == 0
                    ? [dateinput.text]
                    : getDates(splitPayment + 2),
                amount: widget.ammount + (widget.ammount * 11 / 100),
              ),
            ),
          );
        },
        title: 'continue to schedule payment',
      ),
    );
  }
}
