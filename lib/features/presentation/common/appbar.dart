import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CurrencyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool? goBackEnabled;
  final VoidCallback? onBackPressed;

CurrencyAppBar(
      {this.title = '',
      this.actions,
      this.goBackEnabled = true,
      this.onBackPressed})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super();

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding:  EdgeInsets.only(left: 5.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.fontColorWhite,
                fontWeight: FontWeight.w800,
                fontSize: 18),
          ),
        ),
      ),
      backgroundColor:AppColors.colorDark,
      elevation: 2,
      actions: actions,

      centerTitle: false,
    );
  }
}
