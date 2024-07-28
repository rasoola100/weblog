import 'package:flutter/material.dart';
import 'package:weblog/const_colors.dart';
import 'package:weblog/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: Assets.images.logo.provider(),
                width: 100,
              ),
              const SizedBox(height: 14,),
               const SpinKitCircle(
                color: ConstColors.primaryColor,
                size: 50
              ),
            ],
          ),
        ),
      ),
    );
  }
}
