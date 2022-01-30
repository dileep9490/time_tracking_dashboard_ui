import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_tracking_dashboard_ui/colors.dart';

import 'package:time_tracking_dashboard_ui/dashboard/model/tracker.dart';

class TrackerCard extends StatelessWidget {
  const TrackerCard(
      {Key? key,
      required this.tracker,
      required this.svgPath,
      required this.backgroundcolor,
      required this.index})
      : super(key: key);

  final Tracker tracker;
  final String svgPath;
  final Color backgroundcolor;
  final int index;

  String previousText(int index) {
    switch (index) {
      case (0):
        return "yesterday - ";
      case (1):
        return "Last Week - ";
      case (2):
      default:
        return "Last Month -";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 180,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              color: backgroundcolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                svgPath,
              ),
            ),
            width: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tracker.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 28),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Text('${tracker.timeframes[index].current.toString()}hrs',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                              fontSize: 32))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/images/icon-ellipsis.svg',
                        height: 8,
                        width: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20),
                      ),
                      Text(
                        "${previousText(index)}${tracker.timeframes[index].previous.toString()}hrs",
                        style: const TextStyle(color: paleBlue, fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
