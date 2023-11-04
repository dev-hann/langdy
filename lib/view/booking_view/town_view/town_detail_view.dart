import 'package:flutter/material.dart';
import 'package:langdy/model/town_comment.dart';
import 'package:langdy/provider/home_provider.dart';
import 'package:langdy/provider/town_detail_provider.dart';
import 'package:langdy/widget/town_booking_panel.dart';
import 'package:langdy/widget/town_comment_list_tile.dart';
import 'package:provider/provider.dart';

class TownDetailView extends StatefulWidget {
  const TownDetailView({super.key});

  static String get name => '/town_detail';
  static PageRoute route() {
    return MaterialPageRoute(builder: (_) {
      return const TownDetailView();
    });
  }

  @override
  State<TownDetailView> createState() => _TownDetailViewState();
}

class _TownDetailViewState extends State<TownDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.endOfFrame.then((value) {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      provider.hideTicket();
    });
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  Widget headImage() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Image.network(
          "https://picsum.photos/200/300",
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
        const Text("Title"),
        const SizedBox(height: 16.0),
        for (final comment in commentList)
          TownCommentListTile(
            item: comment,
          ),
        ElevatedButton(
          onPressed: onTapLoadComment,
          child: const Text("load Comment"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TownDetailProvider>(context);
    return PanelBookingPanel(
      body: Scaffold(
        appBar: appBar(),
        body: ListView(
          children: [
            headImage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: commentListview(
                commentList: provider.commentList,
                onTapLoadComment: provider.loadCommentList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
