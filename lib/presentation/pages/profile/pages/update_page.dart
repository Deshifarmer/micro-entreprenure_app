import 'package:deshifarmer/presentation/widgets/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

// Create an instance of the ShorebirdCodePush class
final shorebirdCodePush = ShorebirdCodePush();

class UpdatingPage extends StatefulWidget {
  const UpdatingPage({super.key});

  @override
  State<UpdatingPage> createState() => _UpdatingPageState();
}

class _UpdatingPageState extends State<UpdatingPage> {
  Future<void> updateTheApp() async {
    await Future.wait([
      shorebirdCodePush.downloadUpdateIfAvailable(),
      Future<void>.delayed(
        const Duration(milliseconds: 250),
      ),
    ]);
    setState(() {
      isLoading = false;
    });
    _showRestartBanner();
  }

  void _showRestartBanner() {
    ScaffoldMessenger.of(context).showMaterialBanner(
      const MaterialBanner(
        content: Text('A new update is ready!'),
        actions: [
          TextButton(
            onPressed: Restart.restartApp,
            child: Text('Restart app'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    updateTheApp();
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: isLoading
              ? LottieBuilder.asset('assets/animations/updating.json')
              : const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Update Completed',
                    ),
                    PrimaryButtonGreen(
                      onpress: Restart.restartApp,
                      title: 'Restart NOW',
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
