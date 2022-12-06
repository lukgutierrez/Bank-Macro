import 'package:bank_macro/Pages/Home_Page.dart';
import 'package:bank_macro/database/models/datamoney.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataMoneyAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Color(0xFFF003156)),
        debugShowCheckedModeBanner: false,
        title: 'BANK MACRO',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: [const Locale('en'), const Locale('es')],
        home: HomePage());
  }
}
