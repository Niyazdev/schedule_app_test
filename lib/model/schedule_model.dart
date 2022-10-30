class ScheduleModel {
  ScheduleModel({
    required this.day,
    required this.enable,
    required this.schedule,
  });

  late final String day;
  late bool enable;
  late final Schedule schedule;

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    enable = json['enable'];
    schedule = Schedule.fromJson(json['schedule']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['day'] = day;
    data['enable'] = enable;
    data['schedule'] = schedule.toJson();
    return data;
  }
}

class Schedule {
  Schedule({
    required this.morning,
    required this.afternoon,
    required this.evening,
  });

  late bool morning;
  late bool afternoon;
  late bool evening;

  Schedule.fromJson(Map<String, dynamic> json) {
    morning = json['morning'];
    afternoon = json['afternoon'];
    evening = json['evening'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['morning'] = morning;
    data['afternoon'] = afternoon;
    data['evening'] = evening;
    return data;
  }

  bool valueBasedOnIndex(int index) {
    if (index == 0) {
      return morning;
    } else if (index == 1) {
      return afternoon;
    } else {
      return evening;
    }
  }

  String keyBasedOnIndex(int index) {
    if (index == 0) {
      return 'morning';
    } else if (index == 1) {
      return 'afternoon';
    } else {
      return 'evening';
    }
  }

  void changeValueByIndex(int index, bool value) {
    if (index == 0) {
      morning = value;
    } else if (index == 1) {
      afternoon = value;
    } else {
      evening = value;
    }
  }
}
