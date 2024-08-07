
import 'package:flutter/material.dart';
import 'package:weblog/const_colors.dart';
import 'package:weblog/const_strings.dart';
import 'package:weblog/gen/assets.gen.dart';
import 'package:weblog/models/fake_data.dart';
import 'package:weblog/my_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
      child: SafeArea(
        child: Column(
          children: [
            // poster
            HomePagePoster(screenSize: screenSize, textTheme: textTheme),
    
            const SizedBox(
              height: 10,
            ),
    
            // tag list
            HomePageTagList(bodyMargin: bodyMargin, textTheme: textTheme),
    
            const SizedBox(
              height: 25,
            ),
    
            // hot post view title
            HotPostViewTitle(bodyMargin: bodyMargin, textTheme: textTheme),
   
            // hot post view listview
            HomePageHotPostList(screenSize: screenSize, bodyMargin: bodyMargin, textTheme: textTheme),
    
            const SizedBox(
              height: 15,
            ),
    
            // hot padcast title
            HotPodcastTitle(bodyMargin: bodyMargin, textTheme: textTheme),
    
            // hot padcast listview
            HomePageHotPodcastList(screenSize: screenSize, bodyMargin: bodyMargin, textTheme: textTheme),
            const SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}

class HomePageHotPodcastList extends StatelessWidget {
  const HomePageHotPodcastList({
    super.key,
    required this.screenSize,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size screenSize;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 3,
      child: ListView.builder(
          itemCount: padcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  7, 5, index == 0 ? bodyMargin : 12, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenSize.height / 5,
                    width: screenSize.width / 3.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1, color: Colors.grey),
                        image: DecorationImage(
                            image: AssetImage(
                                padcastList[index].imgPadcast),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  SizedBox(
                      width: screenSize.width / 3.5,
                      child: Text(
                        padcastList[index].title,
                        style: textTheme.labelLarge,
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            );
          }),
    );
  }
}

class HotPodcastTitle extends StatelessWidget {
  const HotPodcastTitle({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 4, bodyMargin, 10),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.podcast.provider(),
            color: ConstColors.titleColor,
            size: 25,
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            ConstStrings.viewHotPadcast,
            style: textTheme.labelMedium,
          )
        ],
      ),
    );
  }
}

class HomePageHotPostList extends StatelessWidget {
  const HomePageHotPostList({
    super.key,
    required this.screenSize,
    required this.bodyMargin,
    required this.textTheme,
  });

  final Size screenSize;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height / 3.2,
      child: ListView.builder(
        itemCount: blogList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                15, 5, index == 0 ? bodyMargin : 7, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    height: screenSize.height / 5.5,
                    width: screenSize.width / 3.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage(
                                blogList[index].imageUrl),
                            fit: BoxFit.cover)),
                    foregroundDecoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(16)),
                      gradient: LinearGradient(
                          colors: ConstGradiantColors.blogPost,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 2,
                    right: 3,
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          blogList[index].writer,
                          style: textTheme.titleSmall,
                        ),
                        Row(
                          children: [
                            Text(
                              blogList[index].views,
                              style: textTheme.labelSmall,
                            ),
                            const Icon(
                              Icons.remove_red_eye_sharp,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                    width: screenSize.width / 3.5,
                    child: Text(
                      blogList[index].content,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}

class HotPostViewTitle extends StatelessWidget {
  const HotPostViewTitle({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 2),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.pen.provider(),
            size: 18,
            color: ConstColors.titleColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            ConstStrings.viewHotPost,
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
    required this.textTheme,
  });

  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          itemCount: tagList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                  0, 0, index == 0 ? bodyMargin : 8, 0),
              child: MainTagsUi(textTheme: textTheme, index: index,),
            );
          }),
    );
  }
}



class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.screenSize,
    required this.textTheme,
  });

  final Size screenSize;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: screenSize.width / 1.1,
          height: screenSize.height / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                // image: AssetImage(homePgaePosterMap["imageAssets"]),
                image: homePgaePosterMap["imageAssets"],
                // image: Assets.images.kermanshah.provider(),
                fit: BoxFit.cover),
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: ConstGradiantColors.homePosteCoverGradient,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homePgaePosterMap["writer"] +
                        " - " +
                        homePgaePosterMap["date"],
                    style: textTheme.titleSmall,
                  ),
                  Row(
                    children: [
                      Text(
                        homePgaePosterMap["view"],
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 17,
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3, 6, 3, 3),
                child: Text(
                  homePgaePosterMap["title"],
                  style: textTheme.titleMedium,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
