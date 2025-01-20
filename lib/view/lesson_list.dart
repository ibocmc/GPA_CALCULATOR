import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/lesson.dart';

class LessonList extends StatelessWidget {
  final Function onDismiss;
  const LessonList({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLesson = DataHelper.allAddedLessonList;
    return allLesson.isNotEmpty
        ? ListView.builder(
            itemBuilder: itemBuilder,
            itemCount: allLesson.length,
          )
        : Text(
            "Please Add Lesson",
            style: AppConstants.titleStyle,
          );
  }

  Widget itemBuilder(BuildContext context, int index) {
    List<Lesson> allLessons = DataHelper.allAddedLessonList;

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        onDismiss(index);
      },
      child: Card(
        child: ListTile(
          title: Text(allLessons[index].name),
          leading: CircleAvatar(
            backgroundColor: AppConstants.mainColor.shade100,
            child: Text(
                (allLessons[index].letterValue * allLessons[index].creditValue)
                    .toStringAsFixed(0)),
          ),
          subtitle: Text(
              "Kredi:${allLessons[index].creditValue} , Not Değeri:${allLessons[index].letterValue}, Harf Değeri:${allLessons[index].letter}"),
        ),
      ),
    );
  }
}
