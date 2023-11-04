import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:langdy/model/town_banner.dart';

class TownBannerWidget extends StatelessWidget {
  TownBannerWidget({
    super.key,
    required this.itemList,
    required this.onTapBanner,
  });
  final List<TownBanner> itemList;
  final Function(TownBanner item) onTapBanner;
  final ValueNotifier<int> _pageNotifier = ValueNotifier(0);

  Widget pageCountWidget() {
    final length = itemList.length;
    if (length == 1) {
      return const SizedBox();
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        child: ValueListenableBuilder<int>(
          valueListenable: _pageNotifier,
          builder: (context, value, _) {
            return Text(
              "${value + 1}/${itemList.length}",
              style: const TextStyle(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget imageListView() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        viewportFraction: 1.0,
        disableCenter: true,
        onPageChanged: (index, reason) {
          _pageNotifier.value = index;
        },
      ),
      items: itemList.map((banner) {
        return GestureDetector(
          onTap: () {
            onTapBanner(banner);
          },
          child: Image.network(
            banner.image,
            fit: BoxFit.cover,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final width = constrains.maxWidth;
        const height = 150.0;
        return SizedBox(
          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              imageListView(),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: pageCountWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
