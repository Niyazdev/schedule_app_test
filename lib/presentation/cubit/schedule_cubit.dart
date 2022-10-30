import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/model/schedule_model.dart';

enum ScheduleState {
  loading,
  updated,
}

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(ScheduleState.loading);

  List<ScheduleModel> schedule = List.generate(
    7,
    (index) {
      String day;
      switch (index) {
        case 0:
          day = 'SUN';
          break;
        case 1:
          day = 'MON';
          break;
        case 2:
          day = 'TUE';
          break;
        case 3:
          day = 'WED';
          break;
        case 4:
          day = 'THURS';
          break;
        case 5:
          day = 'FRI';
          break;
        case 6:
          day = 'SAT';
          break;
        default:
          day = 'SUN';
          break;
      }
      return ScheduleModel(
        day: day,
        enable: false,
        schedule: Schedule(
          morning: false,
          afternoon: false,
          evening: false,
        ),
      );
    },
  );

  String displayLandingPageText() {
    String homeText = '';
    for (int i = 0; i < schedule.length; i++) {
      if (schedule[i].enable) {
        if (i == 0) {
          homeText = 'Hi Jose you are available in ';
        }
        homeText = '$homeText ${_scheduleSlots(schedule[i])}';
      }
    }
    return homeText;
  }

  String _scheduleSlots(ScheduleModel model) {
    String data = model.day;
    if (model.schedule.morning) data = '$data Morning';
    if (model.schedule.afternoon) data = '$data Afternoon';
    if (model.schedule.evening) data = '$data Evening';
    return data;
  }

  void updateSchedule(int index, ScheduleModel model) {
    emit(ScheduleState.loading);
    schedule[index] = model;
    emit(ScheduleState.updated);
  }
}
