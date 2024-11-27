// logic/bloc/currency_event.dart
import 'package:flutter/cupertino.dart';

import '../../../data/models/request/currency_request.dart';
import '../base_event.dart';

@immutable
abstract class UserEvent extends BaseEvent {}

class CurrencyDataEvent extends UserEvent {
  final CurrencyRequest currencyRequest;

  CurrencyDataEvent({required this.currencyRequest});
}
