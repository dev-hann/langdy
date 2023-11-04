import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelBookingPanel extends StatelessWidget {
  PanelBookingPanel({
    super.key,
    required this.body,
  });

  final Widget body;
  final PanelController controller = PanelController();
  final ValueNotifier<double> _offsetNotifier = ValueNotifier(0);

  Widget headerWidget() {
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
                      const Expanded(child: Text("title")),
                      IconButton(
                        onPressed: () {
                          controller.close();
                        },
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
            onPressed: () {
              controller.open();
            },
            child: const Text("Booking"),
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
          child: const Text("Share"),
        ),
        const SizedBox(width: 16.0),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Enter"),
        ),
      ],
    );
  }

  Widget typeWidget() {
    return const Row(
      children: [
        Text("lang: zh"),
        Text("lang: zh"),
        Text("lang: zh"),
      ],
    );
  }

  Widget scheduleItemWidget() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Datetime"),
              Text("time"),
              Text("usercount"),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Booking"),
        ),
      ],
    );
  }

  Widget scheduleListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          children: [
            scheduleItemWidget(),
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

  Widget panelWidget() {
    return Column(
      children: [
        headerWidget(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              typeWidget(),
              const SizedBox(height: 16.0),
              scheduleListView(),
              descText(),
            ],
          ),
        ),
        footerButton(),
        const SizedBox(
          height: kBottomNavigationBarHeight * 1.6,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingUpPanel(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 150.0),
          child: body,
        ),
        minHeight: 72.0,
        maxHeight: MediaQuery.of(context).size.height,
        controller: controller,
        onPanelSlide: (position) {
          _offsetNotifier.value = position;
        },
        // isDraggable: false,
        panel: panelWidget(),
      ),
    );
  }
}
