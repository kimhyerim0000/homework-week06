import 'package:myapp/week05/calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isTime;

  const CustomTextField({
    required this.label,  // 텍스트 필드 제목
    required this.isTime, // 시간 선택하는 텍스트 필드인지 여부
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(  // 세로로 텍스트와 텍스트 필드 배치
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: isTime ? 0 : 1,
          child: TextFormField(
            cursorColor: Colors.grey, // 커서 색상 변경경
            maxLines: isTime ? 1 : null,
            expands: !isTime,
            keyboardType: isTime ? TextInputType.number : TextInputType.multiline,
            inputFormatters: isTime
             ? [
              FilteringTextInputFormatter.digitsOnly,
            ]
                : [],
          )
        )
      ],
    );
  }
}