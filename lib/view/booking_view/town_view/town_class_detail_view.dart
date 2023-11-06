import 'package:flutter/material.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/provider/town_detail_provider.dart';
import 'package:langdy/widget/town_booking_panel.dart';
import 'package:langdy/widget/town_comment_list_tile.dart';
import 'package:provider/provider.dart';

class TownClassDetailView extends StatefulWidget {
  const TownClassDetailView({
    super.key,
    required this.townID,
  });
  final String townID;

  static PageRoute route(String townID) {
    return MaterialPageRoute(builder: (_) {
      return TownClassDetailView(
        townID: townID,
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
        .requestTownClassDetail(widget.townID);
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
        const Text("참여자 후기 (최근 50건)"),
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
      return Center(
        child: Text(provider.error!.message),
      );
    }
    final detailPage = provider.detailPage;
    if (detailPage == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Stack(
      children: [
        PanelBookingPanel(
          detailPage: detailPage,
          onTapBooking: (schedule) {
            provider.requestBookingSchedule(schedule);
          },
          body: Scaffold(
            appBar: appBar(
              title: detailPage.title,
            ),
            body: ListView(
              children: [
                bannerImage(
                  image: detailPage.bannerImage,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: commentListview(
                    commentList: provider.commentList,
                    onTapLoadComment: provider.loadNextCommentList,
                  ),
                ),
              ],
            ),
          ),
        ),
        overlayWidget(provider.isOverlayLoading),
      ],
    );
  }
}
