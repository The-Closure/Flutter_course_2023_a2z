import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:padding_and/resources/color_schema.dart';
import 'package:padding_and/view/homepage.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp( 
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files 
      fallbackLocale: Locale('en'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(colorSchemeSeed: primary,),
      debugShowCheckedModeBanner: false,
      home:HomePage()  ,
    );
  }
}

