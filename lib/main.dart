import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sky_code/services/locator/services_locator.dart';
import 'package:sky_code/utills/custom_animation.dart';
import 'package:sky_code/widget/cute_cat.dart';
import 'package:sky_code/widget/dashboard.dart';

Future<void> main() async {
  setupServiceLocator();
  configLoading();
  await SentryFlutter.init(
        (options) {
      options.dsn ='https://7ae84d6f170a6958ba38c867f9d20359@o4504168230354944.ingest.us.sentry.io/4507023756689408';
    },
    appRunner: () => runApp(MyApp()),
  );
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.tealAccent
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbed Interface',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabbedInterface(),
    );
  }
}

class TabbedInterface extends StatelessWidget {
  const TabbedInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabbed Interface',style: TextStyle(fontSize: 20)),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'List'),
              Tab(text: 'Dashboard'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CuteCat(),
            DashBoard(),
          ],
        ),
      ),
    );
  }
}
