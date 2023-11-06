import 'package:flutter/material.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/provider/town_detail_provider.dart';
import 'package:langdy/widget/town_booking_panel.dart';
import 'package:langdy/widget/town_comment_list_tile.dart';
import 'package:provider/provider.dart';

class TownClassDetailView extends StatefulWidget {
  const TownClassDetailView({
    super.key,
    required this.townClass,
  });
  final TownClass townClass;

  static PageRoute route(TownClass townClass) {
    return MaterialPageRoute(builder: (_) {
      return TownClassDetailView(
        townClass: townClass,
      );
    });
  }

  @override
  State<TownClassDetailView> createState() => _TownClassDetailViewState();
}

class _TownClassDetailViewState extends State<TownClassDetailView> {
  @override
  void initState() {
    super.initState();
    Provider.of<TownDetailProvider>(context, listen: false)
        .requestTownClassDetail(widget.townClass.id);
  }

  AppBar appBar({
    required String title,
  }) {
    return AppBar(
      title: Text(title),
    );
  }

  Widget bannerImage({
    required String image,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Image.network(
          image,
          width: width,
          height: 250.0,
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget commentListview({
    required List<TownComment> commentList,
    required VoidCallback onTapLoadComment,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "참여자 후기 (최근 50건)",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16.0),
        for (final comment in commentList)
          TownCommentListTile(
            item: comment,
          ),
        ElevatedButton(
          style: const ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(
              Colors.black,
            ),
            side: MaterialStatePropertyAll(
              BorderSide(color: Colors.black),
            ),
            backgroundColor: MaterialStatePropertyAll(
              Colors.transparent,
            ),
            elevation: MaterialStatePropertyAll(0.0),
          ),
          onPressed: onTapLoadComment,
          child: const Center(
            child: Text("참여자 후기 더보기"),
          ),
        )
      ],
    );
  }

  Widget overlayWidget(bool visibilty) {
    if (!visibilty) {
      return const SizedBox();
    }
    return ColoredBox(
      color: Colors.black.withOpacity(0.6),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TownDetailProvider>(context);
    if (provider.hasError) {
      WidgetsBinding.instance.endOfFrame.then((value) async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("오류 발생!"),
              content: const Text("알수 없는 오류가 발생했습니다 \n잠시 후 다시 시도해주세요:("),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("확인"),
                ),
              ],
            );
          },
        );

        provider.clearError();
      });
    }
    final detail = provider.detail;
    return Stack(
      children: [
        Stack(
          children: [
            Scaffold(
              appBar: appBar(
                title: widget.townClass.title,
              ),
              body: Builder(
                builder: (context) {
                  if (detail == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    children: [
                      bannerImage(
                        image: detail.bannerImage,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: commentListview(
                          commentList: provider.commentList,
                          onTapLoadComment: provider.loadNextCommentList,
                        ),
                      ),
                      const SizedBox(
                        height: kBottomNavigationBarHeight,
                      ),
                    ],
                  );
                },
              ),
            ),
            PanelBookingPanel(
              detail: detail,
              onTapCancel: (schedule) {
                provider.requestCancelSchedule(
                  townClassID: widget.townClass.id,
                  schedule: schedule,
                );
              },
              onTapBooking: (schedule) {
                provider.requestBookingSchedule(
                  townClassID: widget.townClass.id,
                  schedule: schedule,
                );
              },
            ),
          ],
        ),
        overlayWidget(provider.isOverlayLoading),
      ],
    );
  }
}
