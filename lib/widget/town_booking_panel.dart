import 'package:flutter/material.dart';
import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town_detail_page.dart';
import 'package:langdy/model/town_item.dart';
import 'package:langdy/util/date_time_format.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelBookingPanel extends StatefulWidget {
  const PanelBookingPanel({
    super.key,
    required this.body,
    required this.detailPage,
    required this.onTapBooking,
  });
  final TownDetailPage detailPage;
  final Function(TownItemSchedule schedule) onTapBooking;
  final Widget body;

  @override
  State<PanelBookingPanel> createState() => _PanelBookingPanelState();
}

class _PanelBookingPanelState extends State<PanelBookingPanel> {
  final ValueNotifier<double> _offsetNotifier = ValueNotifier(0);
  final PanelController controller = PanelController();

  Widget headerWidget({
    required String title,
    required VoidCallback onTapClose,
    required VoidCallback onTapOpen,
  }) {
    return ValueListenableBuilder<double>(
      valueListenable: _offsetNotifier,
      builder: (context, value, child) {
        if (value > 0.5) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(title),
                      ),
                      IconButton(
                        onPressed: onTapClose,
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 32.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 0),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onTapOpen,
            child: const Center(
              child: Text("예약하기"),
            ),
          ),
        );
      },
    );
  }

  Widget footerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text("공유하기"),
        ),
        const SizedBox(width: 16.0),
        ElevatedButton(
          onPressed: () {},
          child: const Text("입장하기"),
        ),
      ],
    );
  }

  Widget typeWidget({
    required LanguageType languageType,
    required String level,
    required int price,
  }) {
    return Row(
      children: [
        Text("언어: ${languageType.toLabel()}"),
        const SizedBox(width: 8.0),
        Text("난이도: $level"),
        const SizedBox(width: 8.0),
        Text("참가비: $price"),
      ],
    );
  }

  Widget scheduleItemWidget({
    required TownItemSchedule schedule,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  DateTimeFormat.townBookingDateformat(schedule.beginDateTime)),
              Text(
                  "${DateTimeFormat.townBookingTimeformat(schedule.beginDateTime)} - ${DateTimeFormat.townBookingTimeformat(schedule.endDatetime)}"),
              Text(
                  "${schedule.currentUserCount}명 예약 / ${schedule.maxiumUserCount}명 정원"),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onTapBooking(schedule);
          },
          child: const Text("예약하기"),
        ),
      ],
    );
  }

  Widget scheduleListView({
    required List<TownItemSchedule> scheduleList,
  }) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: scheduleList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            scheduleItemWidget(
              schedule: scheduleList[index],
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget descText() {
    return const Text.rich(
      TextSpan(children: [
        TextSpan(text: "랭디타운 이용안내\n"),
        TextSpan(
            text:
                "* 랭디타운은 시작시간 12시간 전부터 입장할 수 있습니다. 미리 입장하여 랭디타운 이용법을 익혀보세요.\n"),
        TextSpan(text: "* 원활한 진행을 위해 시작시간 15분 전에 입장하여 준비해주세요."),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: widget.body,
        ),
        minHeight: 72.0,
        maxHeight: MediaQuery.of(context).size.height,
        controller: controller,
        onPanelSlide: (position) {
          _offsetNotifier.value = position;
        },
        isDraggable: false,
        panel: Column(
          children: [
            headerWidget(
              title: widget.detailPage.title,
              onTapOpen: () {
                controller.open();
              },
              onTapClose: () {
                controller.close();
              },
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  typeWidget(
                    languageType: widget.detailPage.languageType,
                    level: widget.detailPage.level,
                    price: widget.detailPage.price,
                  ),
                  const SizedBox(height: 16.0),
                  scheduleListView(
                    scheduleList: widget.detailPage.scheduleList,
                  ),
                  descText(),
                ],
              ),
            ),
            footerButton(),
            const SizedBox(
              height: kBottomNavigationBarHeight * 1.6,
            )
          ],
        ),
      ),
    );
  }
}
