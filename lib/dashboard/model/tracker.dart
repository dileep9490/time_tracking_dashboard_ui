import 'dart:convert';

class Tracker {
  final String title;
  List<TimeFrame> timeframes = [];

  Tracker(
      {required this.title,
      required TimeFrame daily,
      required TimeFrame weekly,
      required TimeFrame monthly}) {
    timeframes = [daily, weekly, monthly];
  }

  factory Tracker.fromMap(Map<String, dynamic> map) {
    return Tracker(
      title: map['title'],
      daily: TimeFrame.fromMap(map['timeframes']['daily']),
      weekly: TimeFrame.fromMap(map['timeframes']['weekly']),
      monthly: TimeFrame.fromMap(map['timeframes']['monthly']),
    );
  }

  factory Tracker.fromJson(String source) =>
      Tracker.fromMap(json.decode(source));
}

class TimeFrame {
  final int current;
  final int previous;

  TimeFrame({required this.current, required this.previous});

  Map<String, dynamic> toMap() {
    return {
      'current': current,
      'previous': previous,
    };
  }

  factory TimeFrame.fromMap(Map<String, dynamic> map) {
    return TimeFrame(
      current: map['current']?.toInt() ?? 0,
      previous: map['previous']?.toInt() ?? 0,
    );
  }
}
