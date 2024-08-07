import 'package:flutter/material.dart';
import 'package:weblog/const_colors.dart';
// import 'package:weblog/const_strings.dart';
import 'package:weblog/gen/assets.gen.dart';
// import 'package:weblog/models/fake_data.dart';
import 'package:weblog/my_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.screenSize,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size screenSize;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: Assets.images.avatar2.provider(),
              height: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.pen.provider(),
                  color: ConstColors.titleColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  "ویرایش تصویر پروفایل",
                  style: textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "رسول امیری",
              style: textTheme.labelLarge,
            ),
            Text(
              "rasoola20@gmail.com",
              style: textTheme.labelLarge,
            ),
            const SizedBox(
              height: 25,
            ),

            BlogDivider(screenSize: screenSize),

            InkWell(
                splashColor: ConstColors.primaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 40,
                    child: Center(
                        child: Text(
                  "مقالات مورد علاقه من",
                  style: textTheme.bodyMedium,
                )))),
            BlogDivider(screenSize: screenSize),
            
            InkWell(
                splashColor: ConstColors.primaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 40,
                    child: Center(
                        child: Text(
                  "پادکست‌های مورد علاقه من",
                  style: textTheme.bodyMedium,
                )))),
            BlogDivider(screenSize: screenSize), 
            
            InkWell(
                splashColor: ConstColors.primaryColor,
                onTap: () {},
                child: SizedBox(
                  height: 40,
                    child: Center(
                        child: Text(
                  "خروج از حساب کاربری",
                  style: textTheme.bodyMedium,
                )))),
                const SizedBox(height: 100,)
          ],
        ));
  }
}
