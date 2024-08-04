import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weblog/const_colors.dart';
import 'package:weblog/view/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(  
    statusBarColor: ConstColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: ConstColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark
  )); 

  runApp(const Blog());
}

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
                color: Color.fromARGB(255, 70, 70, 70),
              ),
              bodyMedium: TextStyle(
                fontSize: 17,
                height: 1.8,
                color: Color.fromARGB(255, 10, 10, 10),
              ),
              titleMedium: TextStyle(
                color: ConstColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w700

              ), 
              titleSmall: TextStyle(
                color: ConstColors.whiteColorHalfOpacity,
                fontSize: 15,
                fontWeight: FontWeight.w600

              ),  
              labelSmall: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500

              ),
              labelMedium: TextStyle(
                color: ConstColors.titleColor,
                fontSize: 18,
                fontWeight: FontWeight.w700

              ),
               labelLarge: TextStyle(
                color: ConstColors.textTileColor,
                fontSize: 18,
                fontWeight: FontWeight.w700

              ),
              )
              
              ),
      home: const SplashScreen(),
    );
  }
}
