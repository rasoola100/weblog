
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weblog/plash_screen.dart';

void main() => runApp(const Blog());

class Blog extends StatelessWidget {
  const Blog({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Persian
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'bNazanin',
        textTheme: const TextTheme(

          titleLarge: TextStyle(
            fontFamily: 'yekan',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255,70,70,70),
          ),
          bodyMedium: TextStyle( 
            fontSize: 17,
            height: 1.8,
            color: Color.fromARGB(255,10,10,10),
          )
        )
      ),
      home: const SplashScreen(),
    );
  }
}
