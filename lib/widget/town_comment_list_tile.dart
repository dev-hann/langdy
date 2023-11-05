import 'package:flutter/material.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/util/date_time_format.dart';

const _userImageSize = 40.0;

class TownCommentListTile extends StatelessWidget {
  TownCommentListTile({
    super.key,
    required this.item,
  });
  final TownComment item;

  final ValueNotifier<bool> _detailNotifier = ValueNotifier(false);

  Widget userImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        item.image,
        width: _userImageSize,
        height: _userImageSize,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: _userImageSize,
            ),
          );
        },
      ),
    );
  }

  Widget userNameText() {
    return Text(item.userName);
  }

  Widget dateTimeText() {
    return Text(
      DateTimeFormat.townCommentformat(item.dateTime),
    );
  }

  Widget titleText() {
    return Text(item.title);
  }

  Widget commentText() {
    return ValueListenableBuilder<bool>(
      valueListenable: _detailNotifier,
      builder: (context, isDetail, _) {
        return Text(
          item.comment,
          maxLines: isDetail ? 1000 : 2,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }

  Widget detailButton() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final tp = TextPainter(
          text: TextSpan(text: item.comment),
          textDirection: TextDirection.ltr,
        );
        tp.layout(maxWidth: width);
        final lines = tp.computeLineMetrics();
        if (lines.length < 3) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ValueListenableBuilder<bool>(
            valueListenable: _detailNotifier,
            builder: (context, isDetail, _) {
              if (isDetail) {
                return GestureDetector(
                  onTap: () {
                    _detailNotifier.value = false;
                  },
                  child: const Text(
                    "간략히 접기",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                );
              }
              return GestureDetector(
                onTap: () {
                  _detailNotifier.value = true;
                },
                child: const Text(
                  "자세히 보기",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        userImage(),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _userImageSize,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    userNameText(),
                    const SizedBox(width: 8.0),
                    dateTimeText(),
                  ],
                ),
              ),
              titleText(),
              commentText(),
              detailButton(),
            ],
          ),
        ),
      ],
    );
  }
}
