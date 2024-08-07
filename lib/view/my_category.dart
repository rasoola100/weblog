import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weblog/const_strings.dart';
import 'package:weblog/gen/assets.gen.dart';
import 'package:weblog/models/fake_data.dart';
import 'package:weblog/my_component.dart';

class MyCategory extends StatefulWidget {
  const MyCategory({super.key});

  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = screenSize.width / 23;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              SvgPicture.asset(
                Assets.images.robotIcon.path,
                height: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                ConstStrings.successRegister,
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                child: const TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                ConstStrings.selectCat,
                style: textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
                child: SizedBox(
                  height: screenSize.height / 5,
                  // width: double.infinity,
                  child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: tagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (!selectedTagList.contains(tagList[index])) {
                                selectedTagList.add(tagList[index]);
                              }
                            });
                          },
                          child: MainTagsUi(textTheme: textTheme, index: index),
                        );
                      })),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SvgPicture.asset(
                Assets.images.arrowBottom.path,
                height: 60,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: bodyMargin, right: bodyMargin),
                child: SizedBox(
                  height: screenSize.height / 6,
                  // width: double.infinity,
                  child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: selectedTagList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio: 0.4,
                      ),
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 242, 242, 242),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 3, 8, 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedTagList[index].title,
                                  style: textTheme.bodyMedium,
                                ),
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTagList.removeAt(index);
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
