import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/util/date_time_format.dart';
import 'package:langdy/widget/border_button.dart';

class TownClassCard extends StatelessWidget {
  const TownClassCard({
    super.key,
    required this.item,
  });
  final TownClass item;

  Widget userCountBar({
    required int maxiumCount,
    required int currentCount,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          width: width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$currentCount명 예약"),
                  Text("$maxiumCount명 정원"),
                ],
              ),
              LinearProgressIndicator(
                value: currentCount / maxiumCount,
                minHeight: 8.0,
                borderRadius: BorderRadius.circular(4.0),
                backgroundColor: Colors.orangeAccent.withOpacity(0.5),
                color: Colors.orangeAccent,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget freeBadge({
    required bool isFree,
  }) {
    if (!isFree) {
      return const SizedBox();
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(4.0),
        child: Text(
          "무료",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget imageOverlayWidget({
    required TownClassState state,
  }) {
    String text = "";
    switch (state) {
      case TownClassState.booking:
        return const SizedBox();
      case TownClassState.bookedUp:
        text = "마감됐어요:)";
      case TownClassState.finished:
        text = "종료됐어요:)";
    }
    return ColoredBox(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget imageWidget({
    required String image,
    required TownClassState state,
    required bool isFree,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: SizedBox(
            width: width,
            height: width / 1.5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: freeBadge(isFree: isFree),
                  ),
                ),
                imageOverlayWidget(
                  state: state,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget typeListView({
    required LanguageType languageType,
    required int level,
  }) {
    return Row(
      children: [
        BorderButton.language(languageType),
        const SizedBox(width: 8.0),
        BorderButton.level(level),
      ],
    );
  }

  Widget title({
    required String title,
  }) {
    return AutoSizeText(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      maxFontSize: 18,
      minFontSize: 12,
    );
  }

  Widget scheduleListView() {
    return Text(
      item.scheduleList
          .map((e) => e.beginDateTime)
          .map((dateTime) => DateTimeFormat.townFormat(dateTime))
          .join(", "),
      style: const TextStyle(color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width / 1.8;
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageWidget(
            image: item.bannerImage,
            isFree: item.price == 0,
            state: item.state,
          ),
          const SizedBox(height: 8.0),
          typeListView(
            languageType: item.languageType,
            level: item.level,
          ),
          const SizedBox(height: 8.0),
          title(
            title: item.title,
          ),
          const SizedBox(height: 8.0),
          scheduleListView(),
          const SizedBox(height: 16.0),
          userCountBar(
            maxiumCount: item.totalMaxiumUserCount,
            currentCount: item.totalCurrentUserCount,
          ),
        ],
      ),
    );
  }
}
