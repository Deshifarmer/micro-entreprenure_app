import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshifarmer/app/app.dart';
import 'package:deshifarmer/bootstrap.dart';
import 'package:deshifarmer/firebase_options.dart';
import 'package:deshifarmer/services/utils/connection_services.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

// late final ConnectivityService connectionService;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // connectionService = await ConnectivityService(Connectivity()).init();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  await bootstrap(() => const App());
}
