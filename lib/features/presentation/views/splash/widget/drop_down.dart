import 'package:currency_converter/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget customDropDown({
  required List<String> items,
  required String value,
  required void Function(String?) onChange,
}) {
  return DropdownButton<String>(
    style: TextStyle(color: AppColors.appColorAccent),
    dropdownColor: AppColors.fontColorGray,
    value: value,
    onChanged: onChange,
    underline: SizedBox(), // Removes the underline
    items: items.map<DropdownMenuItem<String>>((String val) {
      return DropdownMenuItem(
        value: val,
        child: Text(val,style: TextStyle(color: AppColors.fontColorWhite),),
      );
    }).toList(),
  );
}
