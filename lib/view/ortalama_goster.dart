import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';

class OrtalamaGoster extends StatelessWidget {
  final double average;
  final int lessonCount;

  const OrtalamaGoster(
      {super.key, required this.average, required this.lessonCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(lessonCount > 0 ? "$lessonCount ders girildi" : "ders seçiniz",
            style: AppConstants.headTextStyle),
        Text(
          average >= 0 ? average.toStringAsFixed(2) : "0.00",
          style: AppConstants.head2TextStyle,
        ),
        Text(
          "Ortalama",
          style: AppConstants.headTextStyle,
        )
      ],
    );
  }
}
