import 'package:myapp/week05/calendar_scheduler/component/custom_text_field.dart';
import 'package:myapp/week05/calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Column(
            // 시간 관련 텍스트 필드와 내용 관련 텍스트 필드 세로로 배치치
            children: [
              Row(
                // 시작 시간, 종료 시간 가로로 배치치
                children: [
                  Expanded(
                    child: CustomTextField( // 시작 시간 입력 필드드
                      label: '시작 시간',
                      isTime: true,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomTextField(
                      label: '종료 시간',
                      isTime: true,
                    ),
                  ),
                ],
              ),
              
            ]
          )
        )
      ),
    );
  }
}