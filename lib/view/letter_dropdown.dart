import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';

class LetterDropdown extends StatefulWidget {
  final Function onLetterChoose;

  const LetterDropdown({
    super.key,
    required this.onLetterChoose,
  });
  @override
  State<LetterDropdown> createState() => _LetterDropdownState();
}

class _LetterDropdownState extends State<LetterDropdown> {
  double choosenLetterValue = 4.00;
 
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<double>(
      value: choosenLetterValue,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: AppConstants.dropDownRadius,
        ),
        filled: true,
        fillColor: AppConstants.mainColor.shade100,
      ),
      items: DataHelper.tumDerslerinHarfListesi(),
      onChanged: (value) {
        setState(() {
          choosenLetterValue = value!;
          widget.onLetterChoose(value);
        });
      },
    );
  }
}
