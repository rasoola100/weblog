import 'package:flutter/material.dart';
import 'package:weblog/const_colors.dart';
import 'package:weblog/gen/assets.gen.dart';
import 'package:weblog/my_component.dart';
import 'package:weblog/view/home_screen.dart';
import 'package:weblog/view/profile_screen.dart';
// import 'package:weblog/view/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomePageState extends State<HomePage> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = screenSize.width / 23;

    // List<Widget> blogMainScreenPages = [
    //   HomeScreen(
    //       screenSize: screenSize, textTheme: textTheme, bodyMargin: bodyMargin),
    //   ProfileScreen(
    //       screenSize: screenSize, textTheme: textTheme, bodyMargin: bodyMargin),
    // ];

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: ConstColors.scaffoldBgColor,
          child: Padding(
            padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                        child: Image.asset(
                  Assets.images.logo.path,
                  scale: 20,
                ))),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.labelMedium,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                 ListTile(
                  onTap: () {},
                  title: Text(
                    "درباره ما ",
                    style: textTheme.labelMedium,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ), 
                ListTile(
                  onTap: () {},
                  title: Text(
                    " اشتراک‌گذاری بلاگ",
                    style: textTheme.labelMedium,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ), 
                ListTile(
                  onTap: () {},
                  title: Text(
                    " بلاگ در گیت هاب",
                    style: textTheme.labelMedium,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ConstColors.scaffoldBgColor,
          elevation: 0,
          title: // app bar
              Padding(
            padding: const EdgeInsets.fromLTRB(7, 10, 7, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: const Icon(Icons.menu)),
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
            Positioned.fill(
              child: IndexedStack(
                index: selectedPageIndex,
                children: [
                  HomeScreen(
                      screenSize: screenSize,
                      textTheme: textTheme,
                      bodyMargin: bodyMargin),
                  ProfileScreen(
                      screenSize: screenSize,
                      textTheme: textTheme,
                      bodyMargin: bodyMargin),
                ],
              ),
            ),
            BottomNavigation(
              screenSize: screenSize,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.screenSize,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size screenSize;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
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
                      onPressed: () => changeScreen(0),
                      icon: ImageIcon(
                        Assets.icons.homeIcon.provider(),
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () => changeScreen(1),
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
