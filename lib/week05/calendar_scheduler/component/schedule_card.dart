import 'package:myapp/week05/calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class _Time extends StatelessWidget {
  final int startTime; // 시작 시간
  final int endTime;  // 종료 시간간

  const _Time({
    required this.startTime,
    required this.endTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
    )
  }

}