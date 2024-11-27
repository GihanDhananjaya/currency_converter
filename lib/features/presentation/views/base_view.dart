import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configurations/app_config.dart';
import '../../../core/service/dependency_injection.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/enums.dart';
import '../../../utils/navigation_routes.dart';
import '../../data/datasources/shared_preference.dart';
import '../bloc/base_bloc.dart';
import '../bloc/base_event.dart';
import '../bloc/base_state.dart';
import '../common/app_button.dart';
import '../common/app_button_outline.dart';


abstract class BaseView extends StatefulWidget {
  BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  final appSharedData = injection<AppSharedData>();

  Base<BaseEvent, BaseState<dynamic>> getBloc();

  Widget buildView(BuildContext context);

  bool _isProgressShow = false;

  @override
  void initState() {
    super.initState();
    if (AppConfig.deviceOS == DeviceOS.ANDROID) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Base>(
        create: (_) => getBloc(),
        child: BlocListener<Base, BaseState>(
          listener: (context, state) {
            if (state is APILoadingState) {
            } else {
              if (state is APIFailureState) {

              } else if (state is AuthorizedFailureState) {
                if (state.isSplash) {

                } else {

                }
              }
            }
          },
          child: Listener(
            child: Container(
                margin: EdgeInsets.only(bottom: Platform.isIOS ? 5.h : 0),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: buildView(context),
                )),
          ),
        ),
      );
  }
}
