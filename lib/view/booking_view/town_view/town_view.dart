import 'package:flutter/material.dart';
import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/provider/town_provider.dart';
import 'package:langdy/view/booking_view/town_view/town_all_view.dart';
import 'package:langdy/view/booking_view/town_view/town_class_detail_view.dart';
import 'package:langdy/widget/town_banner_widget.dart';
import 'package:langdy/widget/town_horizontal_list_view.dart';
import 'package:provider/provider.dart';

class TownView extends StatefulWidget {
  const TownView({super.key});

  @override
  State<TownView> createState() => _TownViewState();
}

class _TownViewState extends State<TownView> {
  @override
  void initState() {
    super.initState();
    refreshTownPage();
  }

  void refreshTownPage() {
    Provider.of<TownProvider>(context, listen: false).requestTownPage();
  }

  Widget bannerPhotoListView({
    required List<TownBanner> bannerList,
  }) {
    return TownBannerWidget(
      itemList: bannerList,
      onTapBanner: (item) {},
    );
  }

  Widget townListview({
    required Town town,
    required Function(TownClass item) onTapTownClass,
    required VoidCallback onTapAllView,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TownHorizontalListView(
        title: town.title,
        classList: town.classList,
        onTapTown: onTapTownClass,
        onTapAllView: onTapAllView,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TownProvider>(context);
    final townPage = provider.townPage;
    if (townPage == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final bannerList = townPage.bannerList;
    final townList = townPage.townList;
    return ListView(
      children: [
        bannerPhotoListView(
          bannerList: bannerList,
        ),
        for (final town in townList)
          townListview(
            town: town,
            onTapTownClass: (townClass) async {
              await Navigator.of(context).push(
                TownClassDetailView.route(townClass),
              );
              refreshTownPage();
            },
            onTapAllView: () async {
              await Navigator.of(context).push(
                TownAllView.route(
                  classList: town.classList,
                ),
              );
              refreshTownPage();
            },
          ),
      ],
    );
  }
}
