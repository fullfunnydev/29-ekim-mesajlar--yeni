import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_view/story_view.dart';

class main_stroy_view extends StatefulWidget {
  const main_stroy_view({Key? key}) : super(key: key);

  @override
  State<main_stroy_view> createState() => _main_stroy_viewState();
}

class _main_stroy_viewState extends State<main_stroy_view> {
  final StoryController controller = StoryController();
  List resimurl = [
    "resim/stor1.jpg",
    "resim/stor2.jpg",
    "resim/stor3.jpg",
    "resim/stor4.jpg",
    "resim/stor5.jpg",
    "resim/stor6.jpg",
    "resim/stor7.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 330.sp,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(18.sp), bottom: Radius.circular(18.sp)),
            child: StoryView(
              controller: controller,
              repeat: true,
              inline: true,
              progressPosition: ProgressPosition.bottom,
              storyItems: [
                StoryItem.pageProviderImage(AssetImage(resimurl[0]),
                    imageFit: BoxFit.fill),
                StoryItem.pageProviderImage(AssetImage(resimurl[1]),
                    imageFit: BoxFit.fill),
                StoryItem.pageProviderImage(AssetImage(resimurl[2]),
                    imageFit: BoxFit.fill),
                StoryItem.pageProviderImage(AssetImage(resimurl[3]),
                    imageFit: BoxFit.fill),
                StoryItem.pageProviderImage(AssetImage(resimurl[4]),
                    imageFit: BoxFit.fill),
                StoryItem.pageProviderImage(AssetImage(resimurl[5]),
                    imageFit: BoxFit.fill),
                StoryItem.pageProviderImage(AssetImage(resimurl[6]),
                    imageFit: BoxFit.fill),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
