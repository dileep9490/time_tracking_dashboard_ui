import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../model/tracker.dart';

part 'tracker_state.dart';

class TrackerCubit extends Cubit<TrackerState> {
  TrackerCubit() : super(TrackerInitial()) {
    getData();
  }
  void getData() async {
    emit(TrackerLoading());
    try {
      List<dynamic> data = await rootBundle
          .loadString('json/data.json')
          .then((value) => jsonDecode(value));

      List<Tracker> trackedData = data.map((e) => Tracker.fromMap(e)).toList();
      
      emit(TrackerLoaded(trackedData: trackedData));
    } catch (e) {
      emit(TrackerError());
    }
  }
}
