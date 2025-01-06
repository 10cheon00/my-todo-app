import 'package:flutter/material.dart';

class DateWidget extends StatelessWidget {
  final DateTime date; // 날짜 입력값 (YYYY-MM-DD 형태)

  const DateWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // 세로 방향 중앙 정렬
      crossAxisAlignment: CrossAxisAlignment.center, // 가로 방향 중앙 정렬
      children: [
        // 연도 표시 (YYYY)
        Text(
          date.year.toString(), // YYYY 추출
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black38,
          ),
          textScaler: TextScaler.noScaling,
        ),
        SizedBox(height: 4), // 연도와 월/일 간의 간격
        // 월/일 표시 (mm/dd)
        Text(
          '${date.month}/${date.day}', // mm/dd 추출
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
