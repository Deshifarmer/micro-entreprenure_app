import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshifarmer/app/app.dart';
import 'package:deshifarmer/bootstrap.dart';
import 'package:deshifarmer/services/connection_services.dart';
import 'package:flutter/widgets.dart';

late final ConnectivityService connectionService;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  connectionService = await ConnectivityService(Connectivity()).init();
  await bootstrap(() => const App());
}
