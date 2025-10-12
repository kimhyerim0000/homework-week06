import 'package:myapp/week06/calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules
  ],
)

class LocalDatabase extends _$LocalDatabase {}