import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/enums.dart';

class AppButtonOutline extends StatefulWidget {
  final String buttonText;
  final Function onTapButton;
  final double width;
  final ButtonType buttonType;
  final Widget? prefixIcon;

  const AppButtonOutline(
      {required this.buttonText,
      required this.onTapButton,
      this.width = 0,
      this.prefixIcon,
      this.buttonType = ButtonType.ENABLED});

  @override
  State<AppButtonOutline> createState() => _AppButtonOutlineState();
}

class _AppButtonOutlineState extends State<AppButtonOutline> {
  Color _buttonColor = AppColors.colorPrimary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (e) {
          setState(() {
            _buttonColor = AppColors.fontColorGray;
          });
        },
        onExit: (e) {
          setState(() {
            _buttonColor = AppColors.colorPrimary;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          width: widget.width == 0 ? double.infinity : widget.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(AppConstants.UI_COMPONENT_PADDING)),
              color: AppColors.fontColorWhite,
              border: Border.all(
                  color: widget.buttonType == ButtonType.ENABLED
                      ? _buttonColor
                      : AppColors.colorPrimary,
                  width: 2)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.prefixIcon ?? const SizedBox.shrink(),
                widget.prefixIcon != null
                    ? const SizedBox(
                        width: 5,
                      )
                    : const SizedBox.shrink(),
                Text(
                  widget.buttonText,
                  style: TextStyle(
                      color: widget.buttonType == ButtonType.ENABLED
                          ? _buttonColor
                          : AppColors.colorPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        if (widget.buttonType == ButtonType.ENABLED) {
          if (widget.onTapButton != null) {
            widget.onTapButton();
          }
        }
      },
    );
  }
}
