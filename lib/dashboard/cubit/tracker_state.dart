part of 'tracker_cubit.dart';

@immutable
abstract class TrackerState extends Equatable {}

class TrackerInitial extends TrackerState {
  @override
  List<Object?> get props => [];
}

class TrackerLoading extends TrackerState {
  @override
  List<Object?> get props => [];
}

class TrackerLoaded extends TrackerState {
  final List<Tracker> trackedData;
  TrackerLoaded({required this.trackedData});
  @override
  List<Object?> get props => [trackedData];
}

class TrackerError extends TrackerState {
  final String message = 'Error';
  @override
  List<Object?> get props => [message];
}
