import 'package:flutter/material.dart';
import 'package:weblog/const_colors.dart';
import 'package:weblog/gen/assets.gen.dart';
import 'package:weblog/view/home_screen.dart';
// import 'package:weblog/view/profile_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = screenSize.width / 23;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.scaffoldBgColor,
        elevation: 0,
        title: // app bar
            Padding(
          padding: const EdgeInsets.fromLTRB(7, 10, 7, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu),
              Image(
                image: Assets.images.logo.provider(),
                height: screenSize.height / 14,
              ),
              const Icon(Icons.search)
            ],
          ),
        ),
      ),
      body: Stack(
        children: [

        // Center(child: Positioned.fill(child: ProfileScreen(screenSize: screenSize, textTheme: textTheme, bodyMargin: bodyMargin))),
        HomeScreen(screenSize: screenSize, textTheme: textTheme, bodyMargin: bodyMargin),
      
        BottomNavigation(screenSize: screenSize, bodyMargin: bodyMargin),
        
      ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.screenSize,
    required this.bodyMargin,
  });

  final Size screenSize;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: screenSize.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: ConstGradiantColors.bottomNavBg,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: screenSize.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient:
                    LinearGradient(colors: ConstGradiantColors.bottomNav)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        Assets.icons.homeIcon.provider(),
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        Assets.icons.user.provider(),
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        Assets.icons.writer.provider(),
                        color: Colors.white,
                        size: 28,
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
