// logic/bloc/currency_state.dart

import 'package:flutter/cupertino.dart';

import '../../../data/models/currency_conversion.dart';
import '../../../data/models/response/currency_response.dart';
import '../base_state.dart';

@immutable
abstract class UserState extends BaseState<UserState> {}

class CurrencyInitial extends UserState {}

class CurrencyLoading extends UserState {}

class CurrencyDataState extends UserState {
  final Results result;

  CurrencyDataState({required this.result,});

}

