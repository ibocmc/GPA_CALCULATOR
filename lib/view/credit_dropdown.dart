import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';

class CreditDropdown extends StatefulWidget {
  final Function onChooseCredit;
  const CreditDropdown({super.key, required this.onChooseCredit});

  @override
  State<CreditDropdown> createState() => _KrediDropdownState();
}

class _KrediDropdownState extends State<CreditDropdown> {
  int choosenCreditValue = 3;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: choosenCreditValue,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: AppConstants.dropDownRadius,
        ),
        filled: true,
        fillColor: AppConstants.mainColor.shade100,
      ),
      items: DataHelper.allCreditList(),
      onChanged: (value) {
        setState(() {
          choosenCreditValue = value!;
          widget.onChooseCredit(value);
        });
      },
    );
  }
}
