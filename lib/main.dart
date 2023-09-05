
import 'package:covid_data/page/check_covid.dart';
import 'package:covid_data/page/cont_med.dart';
import 'package:covid_data/result/result_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
          Locale('en', 'US'), // English
          Locale('th', 'TH'), // Thai
    ],
      
      home:Memo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// enum SingingCharacter { positive, negative }
