import 'package:authority_tracker/config/route/route_config.dart';
import 'package:authority_tracker/data/data_sources/one_signal.dart';
import 'package:authority_tracker/data/data_sources/providers.dart';
import 'package:authority_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.initialize(OneSignalCredentials.appId);
  OneSignal.Notifications.requestPermission(true);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp.router(
        routerConfig: AppRouteConfig.goRouter,
        title: 'Authority Tracker',
        theme: ThemeData(
          fontFamily: 'Lufga',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      ),
    );
  }
}
