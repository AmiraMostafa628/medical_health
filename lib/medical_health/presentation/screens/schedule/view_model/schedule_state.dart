import 'package:equatable/equatable.dart';

class ScheduleStates extends Equatable{
  final int selectedScheduleDay;
  final Map<String,String>? currentDate;



  const ScheduleStates({
    required this.selectedScheduleDay,
    this.currentDate
  }
);


  ScheduleStates copyWith({
    int? selectedScheduleDay,
    Map<String,String>? currentDate,

  }) {
    return ScheduleStates(
      selectedScheduleDay: selectedScheduleDay ?? this.selectedScheduleDay,
      currentDate: currentDate?? this.currentDate,


    );
  }

  @override
  List<Object?> get props => [
    selectedScheduleDay,
    currentDate
  ];

}