import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';

class AppDropdownData {
  final int id;
  final String data;

  AppDropdownData({required this.id, required this.data});
}

class CurrencyComponent extends StatelessWidget {
  final String? dropDownHint;
  final String? guideTitle;
  final bool? isMandetory;
  final double? width;
  final List<AppDropdownData> dataSet;
  final int? selectedValue;
  final Function(AppDropdownData) onSelect;
  final Color? guidLineColor;
  final TextEditingController? amountController;
  final String? currencyHint;
  final List<AppDropdownData> currencyList;
  final int? selectedCurrency;
  final Function(AppDropdownData) onCurrencySelect;

  CurrencyComponent({
    required this.dataSet,
    this.selectedValue,
    this.dropDownHint,
    this.width,
    this.guideTitle,
    this.isMandetory = false,
    required this.onSelect,
    this.guidLineColor,
    required this.amountController,
    required this.currencyHint,
    required this.currencyList,
    this.selectedCurrency,
    required this.onCurrencySelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Guide title
        Padding(
          padding: EdgeInsets.only(left: 5.w, bottom: 6.h),
          child: Text(
            guideTitle ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: AppDimensions.kFontSize16,
              color: AppColors.fontColorGray,
            ),
          ),
        ),
        SizedBox(height: 5.h),

        // TextField for amount input
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Enter amount',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColorGray, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColorGray, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            filled: true,
            fillColor: AppColors.fieldBackgroundColor,
            contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          ),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: AppDimensions.kFontSize14,
            color: AppColors.appColorAccent,
          ),
        ),
        SizedBox(height: 10.h),

        // Dropdown for input currency
        DropdownButtonFormField2<int>(
          hint: Text(
            currencyHint ?? 'Select currency',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.appColorAccent,
              fontSize: AppDimensions.kFontSize14,
              fontWeight: FontWeight.w600,
            ),
          ),
          items: currencyList
              .map((currency) => DropdownMenuItem<int>(
            value: currency.id,
            child: Text(
              currency.data,
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: AppColors.appColorAccent,
                fontSize: AppDimensions.kFontSize14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ))
              .toList(),
          value: selectedCurrency,
          onChanged: (value) {
            AppDropdownData? selectedCurrency;
            for (var currency in currencyList) {
              if (currency.id == value) {
                selectedCurrency = currency;
                break;
              }
            }
            onCurrencySelect(selectedCurrency!);
          },
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.fontColorWhite,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColorGray, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColorGray, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            contentPadding: EdgeInsets.only(right: 16.w),
            filled: true,
            fillColor: AppColors.fieldBackgroundColor,
          ),
          icon: Icon(Icons.arrow_drop_down, color: AppColors.fontColorGray),
        ),
        SizedBox(height: 10.h),

        // Dropdown for selecting item from the main dataset
        DropdownButtonFormField2<int>(
          hint: Text(
            dropDownHint ?? 'Select item',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.appColorAccent,
              fontSize: AppDimensions.kFontSize14,
              fontWeight: FontWeight.w600,
            ),
          ),
          items: dataSet
              .map((item) => DropdownMenuItem<int>(
            value: item.id,
            child: Container(
              width: width ?? 85.w,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                item.data,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.appColorAccent,
                  fontSize: AppDimensions.kFontSize14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            AppDropdownData? selectedItem;
            for (var element in dataSet) {
              if (element.id == value) {
                selectedItem = element;
                break;
              }
            }
            onSelect(selectedItem!);
          },
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.fontColorWhite,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColorGray, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.fontColorGray, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
            ),
            contentPadding: EdgeInsets.only(bottom: 24.h, right: 16.w),
            filled: true,
            fillColor: AppColors.fieldBackgroundColor,
          ),
          icon: Icon(Icons.arrow_drop_down, color: AppColors.fontColorGray),
        ),
      ],
    );
  }
}
