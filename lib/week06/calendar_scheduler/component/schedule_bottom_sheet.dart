import 'package:myapp/week06/calendar_scheduler/component/custom_text_field.dart';
import 'package:myapp/week06/calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey(); // 폼 key 생성

  int? startTime; // 시작 시간 저장 변수
  int? endTime;   // 종료 시간 저장 변수
  String? content; // 일정 내용 저장 변수

  @override
  Widget build(BuildContext context) {
    // 키보드 높이 가져오기
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Form(
      key: formKey,
      child: SafeArea(
        child: Container(
          // 화면 반 높이에 키보드 높이 추가하기
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset), // 패딩에 키보드 높이 추가해서 위젯 전반적으로 위로 올려주기
            child: Column(
              // 시간 관련 텍스트 필드와 내용 관련 텍스트 필드 세로로 배치
              children: [
                Row(
                  // 시작 시간, 종료 시간 가로로 배치
                  children: [
                    Expanded(
                      child: CustomTextField( // 시작 시간 입력 필드
                        label: '시작 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          // 저장이 실행되면 startTime 변수에 텍스트 필드값 저장
                          startTime= int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: CustomTextField( // 종료 시간 입력 필드
                        label: '종료 시간',
                        isTime: true,
                        onSaved: (String? val) {
                          // 저장이 실행되면 endTime 변수에 텍스트 필드값 저장
                          endTime= int.parse(val!);
                        },
                        validator: timeValidator,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: CustomTextField( // 내용 입력 필드
                    label: '내용',
                    isTime: false,
                    onSaved: (String? val) {
                    // 저장이 실행되면 content 변수에 텍스트 필드값 저장
                      content= val;
                    },
                    validator: contentValidator,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onSavePressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: PRIMARY_COLOR,
                    ),
                    child: Text('저장'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSavePressed() {}

  String? timeValidator(String? val) {}      // 시간값 검증

  String? contentValidator(String? val) {}   // 내용값 검증
  
}
// 미리 정의해둔 함수수
String? timeValidator(String? val) {  // 시간 검증 함수
  if (val ==null) {
    return '값을 입력해주세요';
  }

  int? number;

  try {
    number = int.parse(val);
  } catch (e) {
    return '숫자를 입력해주세요';
  }

  if (number <0 || number > 24) {
    return '0시부터 24시 사이를 입력해주세요';
  }

  return null;
}

// 미리 정의해둔 함수
String? contentValidator(String? val) { // 내용 검증 함수
  if(val == null || val.length ==0) {
    return '값을 입력해주세요';
  }

  return null;
}
