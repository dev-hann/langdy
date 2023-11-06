import 'package:flutter/material.dart';
import 'package:langdy/enum/language_type.dart';
import 'package:langdy/model/town_class_detail.dart';
import 'package:langdy/model/town_class.dart';
import 'package:langdy/model/town_class_schedule.dart';
import 'package:langdy/util/date_time_format.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelBookingPanel extends StatefulWidget {
  const PanelBookingPanel({
    super.key,
    required this.detail,
    required this.onTapBooking,
    required this.onTapCancel,
  });
  final TownClassDetail? detail;
  final Function(TownClassSchedule schedule) onTapBooking;
  final Function(TownClassSchedule schedule) onTapCancel;

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
    required TownClassSchedule schedule,
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
        scheduleButton(
          schedule: schedule,
        ),
      ],
    );
  }

  Widget scheduleButton({
    required TownClassSchedule schedule,
  }) {
    String text = "오류발생";
    VoidCallback? callback;
    if (!schedule.hasError) {
      // through [UsreProvider],can get user ID
      if (schedule.isBooked("TestUserID")) {
        text = "취소하기";
        callback = () => widget.onTapCancel(schedule);
      } else {
        switch (schedule.state) {
          case TownClassState.booking:
            text = "예약하기";
            callback = () => widget.onTapBooking(schedule);
            break;
          case TownClassState.bookedUp:
            text = "마감";
            break;
          case TownClassState.finished:
            text = "종료";
            break;
        }
      }
    }
    return ElevatedButton(
      onPressed: callback,
      child: Text(text),
    );
  }

  Widget scheduleListView({
    required List<TownClassSchedule> scheduleList,
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
    final detail = widget.detail;
    if (detail == null) {
      return const SizedBox();
    }
    return SlidingUpPanel(
      minHeight: 72.0,
      maxHeight: MediaQuery.of(context).size.height,
      controller: controller,
      onPanelSlide: (position) {
        _offsetNotifier.value = position;
      },
      isDraggable: false,
      panel: Material(
        child: Column(
          children: [
            headerWidget(
              title: detail.title,
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
                    languageType: detail.languageType,
                    level: detail.level,
                    price: detail.price,
                  ),
                  const SizedBox(height: 16.0),
                  scheduleListView(
                    scheduleList: detail.scheduleList,
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
