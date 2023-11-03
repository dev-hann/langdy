import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TownView extends StatelessWidget {
  const TownView({super.key});

  Widget headerPhotoListView() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        viewportFraction: 1.0,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.amber),
              child: Text('text $i'),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        headerPhotoListView(),
      ],
    );
  }
}
