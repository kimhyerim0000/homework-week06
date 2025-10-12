import 'package:myapp/week06/calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules
  ],
)

class LocalDatabase extends _$LocalDatabase {
  Stream<List<Schedule>> watchSchedules(DateTime date) {
  return (select(schedules)..where((s) => s.date.equals(date))).watch();
}
  Future<int> createSchedule(SchedulesCompanion data) =>
    into(schedules).insert(data);

  Future<int> removeSchedule(int id) =>
    (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  @override
  int get schemaVersion => 1;
}