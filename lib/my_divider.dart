import 'package:flutter/material.dart';

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