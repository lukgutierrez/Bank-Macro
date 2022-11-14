import 'package:bank_macro/Pages/Home_Page.dart';
import 'package:bank_macro/models/Movimientos_Cuenta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        home: MovimientosCuenta());
  }
}
