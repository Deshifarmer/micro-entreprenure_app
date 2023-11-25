import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class FinancePage3 extends StatelessWidget {
  const FinancePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request finance'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'We split your payment into 4 payments over 6 weeks. Your first payment is due today',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () {},
        title: 'continue to schedule payment',
      ),
    );
  }
}
