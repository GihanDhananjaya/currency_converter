import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/enums.dart';
import 'app_button.dart';
import 'app_button_outline.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? description;
  final Color? descriptionColor;
  final String? subDescription;
  final Color? subDescriptionColor;
  final AlertType? alertType;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final VoidCallback? onPositiveCallback;
  final VoidCallback? onNegativeCallback;
  final Widget? dialogContentWidget;
  final ButtonType? buttonType;

  final bool? isSessionTimeout;

  AppDialog({
    required this.title,
    this.description,
    this.descriptionColor,
    this.subDescription,
    this.subDescriptionColor,
    this.alertType,
    this.onPositiveCallback,
    this.onNegativeCallback,
    this.positiveButtonText,
    this.negativeButtonText,
    this.dialogContentWidget,
    this.isSessionTimeout,
    this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
            alignment: FractionalOffset.center,
            padding: const EdgeInsets.all(20),
            child: Wrap(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstants.UI_COMPONENT_PADDING)),
                      gradient: AppConstants.COMMON_UI_GRADIENT,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.colorPrimary),
                          ),
                          dialogContentWidget != null
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 9, right: 9),
                                  child: dialogContentWidget,
                                )
                              : const SizedBox(),
                          description != null
                              ? Padding(
                                  padding: EdgeInsets.only(top: 25),
                                  child: Text(
                                    description ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: descriptionColor ??
                                            AppColors.colorPrimary),
                                  ),
                                )
                              : const SizedBox(),
                          subDescription != null
                              ? Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text(
                                    subDescription ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: subDescriptionColor ??
                                            AppColors.colorBackground),
                                  ),
                                )
                              : const SizedBox(),
                          Padding(
                            padding: EdgeInsets.only(top: 42),
                            child: AppButton(
                              buttonText: positiveButtonText ?? "OK",
                              buttonType: buttonType ?? ButtonType.ENABLED,
                              onTapButton: () {
                                Navigator.pop(context);
                                if (onPositiveCallback != null) {
                                  onPositiveCallback!();
                                }
                              },
                            ),
                          ),
                          negativeButtonText != null
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    AppButtonOutline(
                                      buttonText: negativeButtonText!,
                                      onTapButton: () {
                                        Navigator.pop(context);
                                        if (onNegativeCallback != null) {
                                          onNegativeCallback!();
                                        }
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
