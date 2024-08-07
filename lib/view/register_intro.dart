import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:validators/validators.dart';
// import 'package:weblog/const_colors.dart';
import 'package:weblog/const_strings.dart';
import 'package:weblog/gen/assets.gen.dart';
import 'package:weblog/view/my_category.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.images.robotIcon.path,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: ConstStrings.welcome,
                  style: textTheme.labelLarge,
                )),
          ),
          ElevatedButton(
            onPressed: () {
              _showEmailModalBottomSheet(context, screenSize, textTheme);
            },
            child: const Text("بزن بریم"),
          )
        ],
      )),
    ));
  }

  Future<dynamic> _showEmailModalBottomSheet(
      BuildContext context, Size screenSize, TextTheme textTheme) {
    return showModalBottomSheet(
      // backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: screenSize.height / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ایمیل خود را وارد کنید",
                    style: textTheme.labelMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (value) {
                        print(
                            value + " is Email = " + isEmail(value).toString());
                      },
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(
                        hintText: "rasoola20@gmail.com",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _activatedCodeBottomSheet(
                            context, screenSize, textTheme);
                      },
                      child: Text(
                        "ادامه",
                        style: textTheme.labelMedium,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _activatedCodeBottomSheet(
      BuildContext context, Size screenSize, TextTheme textTheme) {
    return showModalBottomSheet(
      // backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: screenSize.height / 2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "کد فعالسازی را وارد کنید",
                    style: textTheme.labelMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (value) {},
                      textAlign: TextAlign.end,
                      decoration: const InputDecoration(
                        hintText: "******",
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyCategory()));
                      },
                      child: Text(
                        "ادامه",
                        style: textTheme.labelMedium,
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
