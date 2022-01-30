import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timeframe_state.dart';

class TimeFrameCubit extends Cubit<TimeFrameState> {
  TimeFrameCubit() : super(TimeFrameState(index: 0));

  void changeTimeFrame(int index) {
    state.index = index;
    emit(TimeFrameState(index: state.index));
  }
}
