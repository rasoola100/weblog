import 'package:flutter/material.dart';
import 'package:weblog/const_colors.dart';
import 'package:weblog/gen/assets.gen.dart';
import 'package:weblog/models/fake_data.dart';

class BlogDivider extends StatelessWidget {
  const BlogDivider({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color.fromARGB(255,128,128,128),
      thickness: 1.2,
      indent: screenSize.width / 6,
      endIndent: screenSize.width / 6,
    );
  }
}


class MainTagsUi extends StatelessWidget {
   MainTagsUi({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(20)),
          // borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: ConstGradiantColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 3, 8, 3),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashtag.provider(),
              color: Colors.white,
              size: 14,
            ),
            const SizedBox(width: 6),
            Text(
              tagList[index].title,
              style: textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}