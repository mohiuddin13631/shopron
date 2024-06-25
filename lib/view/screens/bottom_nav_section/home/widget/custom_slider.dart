import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/my_color.dart';
class CustomSlider extends StatefulWidget {

  // final List<String> imageList;
  final List<String> bannerList;

  const CustomSlider({
    super.key,
    required this.bannerList,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {

          },
          child: CarouselSlider(
            options: CarouselOptions(
              height: orientation == Orientation.portrait ? size.height * .16 : size.height * .35,
              onPageChanged: (index, reason) {
                currentIndex = index;
                setState(() {});
              },
            ),
            items:widget.bannerList.map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(item),
                  fit: BoxFit.cover
                )
              ),
            )).toList(),
          ),
        ),
        const SizedBox(height: 4,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: size.height * .0055,
              backgroundColor: currentIndex == index ? MyColor.primaryColor :  MyColor.naturalLight,
            ),
          ),)
        )
      ],
    );
  }
}