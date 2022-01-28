import 'dart:convert';

class Tracker {
  final String title;
  final TimeFrame daily;
  final TimeFrame weekly;
  final TimeFrame monthly;

  Tracker(
      {required this.title,
      required this.daily,
      required this.weekly,
      required this.monthly});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'daily': daily.toMap(),
      'weekly': weekly.toMap(),
      'monthly': monthly.toMap(),
    };
  }

  factory Tracker.fromMap(Map<String, dynamic> map) {
    return Tracker(
      title: map['title'],
      daily: TimeFrame.fromMap(map['timeframes']['daily']),
      weekly: TimeFrame.fromMap(map['timeframes']['weekly']),
      monthly: TimeFrame.fromMap(map['timeframes']['monthly']),
    );
  }

  String toJson() => json.encode(toMap());

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
