import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_tracking_dashboard_ui/colors.dart';
import 'package:time_tracking_dashboard_ui/dashboard/cubit/timeframe_cubit.dart';
import 'package:time_tracking_dashboard_ui/dashboard/model/tracker.dart';
import 'package:time_tracking_dashboard_ui/dashboard/widgets/header_widget.dart';
import 'package:time_tracking_dashboard_ui/dashboard/widgets/tracker_widget.dart';

import '../cubit/tracker_cubit.dart';

class DashBoradPage extends StatelessWidget {
  const DashBoradPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: veryDarkBlue,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TrackerCubit(),
            ),
            BlocProvider(
              create: (context) => TimeframeCubit(),
            ),
          ],
          child: const _DashBoardView(),
        ),
      ),
    );
  }
}

class _DashBoardView extends StatelessWidget {
  const _DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackerCubit, TrackerState>(
      builder: (context, state) {
        if (state is TrackerInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrackerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TrackerLoaded) {
          List<Tracker> reqlist = state.trackedData;
          return SingleChildScrollView(
            child: Column(
              children: [
                const HeaderWidget(),
                TrackerCard(
                  svgPath: "assets/images/icon-work.svg",
                  tracker: reqlist[0],
                  backgroundcolor: workColor,
                ),
                TrackerCard(
                    tracker: reqlist[1],
                    svgPath: "assets/images/icon-play.svg",
                    backgroundcolor: playColor),
                TrackerCard(
                    tracker: reqlist[2],
                    svgPath: "assets/images/icon-study.svg",
                    backgroundcolor: studyColor),
                TrackerCard(
                    tracker: reqlist[3],
                    svgPath: "assets/images/icon-exercise.svg",
                    backgroundcolor: exerciseColor),
                TrackerCard(
                    tracker: reqlist[4],
                    svgPath: "assets/images/icon-social.svg",
                    backgroundcolor: socialColor),
                TrackerCard(
                    tracker: reqlist[5],
                    svgPath: "assets/images/icon-self-care.svg",
                    backgroundcolor: selfcareColor)
              ],
            ),
          );
        } else {
          return const Center(
            child: Icon(Icons.error),
          );
        }
      },
    );
  }
}
