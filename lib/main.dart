import 'package:flutter/material.dart';
import 'package:phen/pages/barber_shop_page.dart';
import 'package:phen/pages/log.dart';
import 'package:phen/pages/sighUp.dart';
import 'package:phen/pages/spec_list.dart';
import 'package:phen/themes/settings.dart';
import 'package:provider/provider.dart';
import 'pages/intro_page.dart';
import 'package:phen/pages/order_page.dart';
import 'package:phen/components/bardershop_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SettingApp settingApp = SettingApp();
  await settingApp.initialize();
  runApp(
    ChangeNotifierProvider.value(
      value: settingApp,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingApp>(
      builder: (context, settingApp, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const IntroPage(),
          theme: settingApp.themeData,
          routes: {
            '/intro_page': (context) => const IntroPage(),
            '/log': (context) => LoginPage(),
            '/barber_shop_page': (context) => BarberShop(),
            '/order': (context) => OrderPage(),
            '/my_spec_list': (context) => SpecList(),

          },
        );
      },
    );
  }
}