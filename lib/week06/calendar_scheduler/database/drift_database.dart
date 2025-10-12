import 'package:myapp/week06/calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules
  ],
)

class LocalDatabase extends _$LocalDatabase {
  Stream<List<Schedules>> watchSchedules(DateTime date) =>
  (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();

  Future<int> create
}