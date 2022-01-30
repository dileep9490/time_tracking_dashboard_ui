import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timeframe_state.dart';

class TimeframeCubit extends Cubit<TimeframeState> {
  TimeframeCubit() : super(TimeframeState(TimeFrame.daily));

  int _index = 0;

  void changeTimeFrame(int index) {
    TimeframeState(TimeFrame.values[index]);
    _index = index;
  }

  get timeFrameindex => _index;
}
