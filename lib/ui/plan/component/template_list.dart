import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class templateList extends StatelessWidget {
  final List<String> imagePath;

  const templateList({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        width: 500,
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagePath.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: SvgPicture.asset(imagePath[index]),
              );
            }),
      ),
    );
  }
}
