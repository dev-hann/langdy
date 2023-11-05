import 'package:flutter/material.dart';
import 'package:langdy/model/town.dart';
import 'package:langdy/model/town_banner.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/provider/town_provider.dart';
import 'package:langdy/view/booking_view/town_view/town_all_view.dart';
import 'package:langdy/view/booking_view/town_view/town_detail_view.dart';
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
    required Function(TownItem item) onTapTown,
    required VoidCallback onTapAllView,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TownHorizontalListView(
        title: town.title,
        townItemList: town.itemList,
        onTapTown: onTapTown,
        onTapAllView: onTapAllView,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TownProvider provider = Provider.of(context);
    if (provider.hasError) {
      return Center(
        child: Text(provider.error!.message),
      );
    }
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
            onTapTown: (item) {
              Navigator.of(context).push(
                TownDetailView.route(item.id),
              );
              // Navigator.of(context).pushNamed(
              //   "/town_detail",
              // );
            },
            onTapAllView: () {
              Navigator.of(context).push(
                TownAllView.route(
                  itemList: town.itemList,
                ),
              );
            },
          ),
      ],
    );
  }
}
