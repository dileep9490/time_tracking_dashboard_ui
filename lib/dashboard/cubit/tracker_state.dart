part of 'tracker_cubit.dart';

@immutable
abstract class TrackerState {}

class TrackerInitial extends TrackerState {}

class TrackerLoading extends TrackerState {}

class TrackerLoaded extends TrackerState {
  final List<Tracker> trackedData;
  TrackerLoaded({required this.trackedData});
}

class TrackerError extends TrackerState {
  final String message = 'Error';
}
