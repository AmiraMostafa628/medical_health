abstract class ScheduleEvent {}

class ScheduleSelectDateIndexEvent extends ScheduleEvent {
  final int index;

  ScheduleSelectDateIndexEvent({
    required this.index,
  });
}

class SelectDateValueEvent extends ScheduleEvent {
  final Map<String,String> currentDate;

  SelectDateValueEvent({
    required this.currentDate,
  });
}