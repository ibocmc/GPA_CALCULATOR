import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/lesson.dart';
import 'package:ortalama_hesapla/view/lesson_list.dart';
import 'package:ortalama_hesapla/view/letter_dropdown.dart';
import 'package:ortalama_hesapla/view/credit_dropdown.dart';
import 'package:ortalama_hesapla/view/ortalama_goster.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double choosenLetterValue = 4.00;
  String enteredCourseLetter = "AA";
  int choosenCreditValue = 3;
  String enteredLessonName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppConstants.mainColor,
      appBar: AppBar(
        title: Text(AppConstants.titleText, style: AppConstants.titleStyle),
        centerTitle: true,
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Column(
              children: [
                _textFieldDersGirme(),
                const Icon(
                  Icons.arrow_downward_rounded,
                  size: 36,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                          ),
                          child: LetterDropdown(
                            onLetterChoose: (letter) {
                              choosenLetterValue = letter;
                              enteredCourseLetter =
                                  DataHelper.scoreToLetter(letter);
                            },
                          )),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: CreditDropdown(onChooseCredit: (credit) {
                            choosenCreditValue = credit;
                          })),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: _addLessonCalculateAvg,
                  icon: const Icon(Icons.add_box),
                  color: AppConstants.mainColor.shade900,
                  iconSize: 96,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppConstants.mainColor.shade100,
                          borderRadius: AppConstants.dropDownRadius,
                        ),
                        child: OrtalamaGoster(
                            average: DataHelper.avgCalculate(),
                            lessonCount: DataHelper.allAddedLessonList.length),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: LessonList(
                onDismiss: (index) {
                  DataHelper.allAddedLessonList.removeAt(index);
                  setState(() {});
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textFieldDersGirme() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          enteredLessonName = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Course Name";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppConstants.mainColor.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  Future<void> _addLessonCalculateAvg() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Lesson addedLesson = Lesson(
          name: enteredLessonName,
          letterValue: choosenLetterValue,
          letter: enteredCourseLetter,
          creditValue: choosenCreditValue);
      DataHelper.addLesson(addedLesson);

      setState(() {});
    }
  }
}
