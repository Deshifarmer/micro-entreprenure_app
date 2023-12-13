import 'package:deshifarmer/presentation/pages/finance_page/api/finance_api.dart';
import 'package:deshifarmer/presentation/pages/finance_page/models/fianance_model.dart';
import 'package:deshifarmer/presentation/pages/home/view/home_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/utils/others_helper.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class FinancePage3 extends StatefulWidget {
  const FinancePage3({
    required this.fm,
    required this.lastWeekdate,
    required this.amount,
    required this.dates,
    super.key,
  });
  final FinanceModel fm;
  final int lastWeekdate;
  final List<String> dates;
  final double amount;

  @override
  State<FinancePage3> createState() => _FinancePage3State();
}

class _FinancePage3State extends State<FinancePage3> {
  int currentIndx = 0;
  bool isLoading = false;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'We split your payment into 4 payments over 6 weeks. Your first payment is due today',
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Stepper(
                onStepTapped: (i) {
                  setState(() {
                    currentIndx = i;
                  });
                },
                currentStep: currentIndx,
                connectorColor:
                    const MaterialStatePropertyAll<Color>(primaryColor),
                connectorThickness: 2,
                controlsBuilder: (context, details) {
                  //! cancel or continue
                  return const SizedBox.shrink();
                },
                steps: widget.dates
                    // .skip(2)
                    .toList()
                    .map(
                      (e) => Step(
                        // label: const Text("HOLA"),
                        // state: StepState.disabled,
                        // isActive: true,

                        title:
                            Text('BDT ${widget.amount / widget.dates.length}'),
                        // content: SizedBox.shrink(),
                        content: Text(
                            'Due in ${widget.dates.indexOf(e) + 1} week ($e) '),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SecondayButtonGreen(
              onpress: () async {
                final loginState = context.read<LoginBloc>().state;
                final token = loginState is LoginSuccess
                    ? loginState.successLoginEntity.token
                    : '';

                setState(() {
                  isLoading = true;
                });
                final isReq = await FinanceAPI().postFinance(
                    widget.fm,
                    token,
                    widget.dates,
                    widget.lastWeekdate.toString(),
                    widget.amount);
                if (isReq) {
                  setState(() {
                    isLoading = false;
                  });
                  await Navigator.pushAndRemoveUntil(
                    context,
                    HomePage.route(),
                    (route) => false,
                  );
                } else {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              title: 'continue to schedule payment',
            ),
    );
  }
}
