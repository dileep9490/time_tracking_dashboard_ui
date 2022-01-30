part of 'timeframe_cubit.dart';

enum TimeFrame { daily, weekly, monthly }

class TimeframeState extends Equatable {
  final TimeFrame state;

  TimeframeState(this.state);
  @override
  List<Object?> get props => [state];
}
