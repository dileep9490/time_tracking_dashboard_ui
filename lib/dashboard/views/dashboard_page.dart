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
              create: (context) => TimeFrameCubit(),
            ),
          ],
          child: const _DashBoardView(),
        ),
      ),
    );
  }
}

class _DashBoardView extends StatefulWidget {
  const _DashBoardView({Key? key}) : super(key: key);

  @override
  State<_DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<_DashBoardView> {
  onPressed(int index) {
    setState(() {
      context.read<TimeFrameCubit>().changeTimeFrame(index);
    });
  }

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
          int index = context.read<TimeFrameCubit>().state.index;
          
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderWidget(
                  onPressed: onPressed,index: index,
                ),
                TrackerCard(
                  svgPath: "assets/images/icon-work.svg",
                  tracker: reqlist[0],
                  backgroundcolor: workColor,
                  index: index,
                ),
                TrackerCard(
                  tracker: reqlist[1],
                  svgPath: "assets/images/icon-play.svg",
                  backgroundcolor: playColor,
                  index: index,
                ),
                TrackerCard(
                  tracker: reqlist[2],
                  svgPath: "assets/images/icon-study.svg",
                  backgroundcolor: studyColor,
                  index: index,
                ),
                TrackerCard(
                  tracker: reqlist[3],
                  svgPath: "assets/images/icon-exercise.svg",
                  backgroundcolor: exerciseColor,
                  index: index,
                ),
                TrackerCard(
                  tracker: reqlist[4],
                  svgPath: "assets/images/icon-social.svg",
                  backgroundcolor: socialColor,
                  index: index,
                ),
                TrackerCard(
                  tracker: reqlist[5],
                  svgPath: "assets/images/icon-self-care.svg",
                  backgroundcolor: selfcareColor,
                  index: index,
                )
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
