import 'package:myapp/week04/calender_scheduler/model/schedule.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules,
  ]
)
class LocalDatabase extends _$LocalDatabase {}