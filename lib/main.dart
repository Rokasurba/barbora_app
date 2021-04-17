import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_router.dart';
import 'constants.dart';
import 'service_locator.dart';

class BarboraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: Constants.appName,
      theme: Constants.lighTheme(context),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Constants.initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(ProviderScope(child: BarboraApp()));
}
