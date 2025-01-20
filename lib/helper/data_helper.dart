import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/model/lesson.dart';

class DataHelper {
  static List<Lesson> allAddedLessonList = [];

  static addLesson(Lesson lesson) {
    allAddedLessonList.add(lesson);
  }

  static double avgCalculate() {
    double totalScore = 0;
    double totalCredit = 0;
    double avg = 0;

    for (var element in allAddedLessonList) {
      totalScore = totalScore + (element.letterValue * element.creditValue);
      totalCredit += element.creditValue;
      avg = totalScore / totalCredit;
    }
    return avg;
  }

  static List<String> _allLessonLetters() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double letterToScore(String value) {
    switch (value) {
      case "AA":
        return 4.00;

      case "BA":
        return 3.50;

      case "BB":
        return 3.00;

      case "CB":
        return 2.50;

      case "CC":
        return 2.00;

      case "DC":
        return 1.50;

      case "DD":
        return 1.00;

      case "FD":
        return 0.50;

      case "FF":
        return 0.00;
      default:
        return -1;
    }
  }

  static String scoreToLetter(double value) {
    switch (value) {
      case 4.00:
        return "AA";

      case 3.50:
        return "BA";

      case 3.00:
        return "BB";

      case 2.50:
        return "CB";

      case 2.00:
        return "CC";

      case 1.50:
        return "DC";

      case 1.00:
        return "DD";

      case 0.50:
        return "FD";

      case 0.00:
        return "FF";
      default:
        return "not valid";
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfListesi() {
    return _allLessonLetters().map((value) {
      return DropdownMenuItem(
        value: letterToScore(value),
        child: Text(value),
      );
    }).toList();
  }

  static List<int> allCredits() {
    return List.generate(
      10,
      (index) => index + 1,
    ).toList();
  }

  static List<DropdownMenuItem<int>> allCreditList() {
    return allCredits()
        .map(
          (e) => DropdownMenuItem(
            value: e.toInt(),
            child: Text(e.toString()),
          ),
        )
        .toList();
  }
}
