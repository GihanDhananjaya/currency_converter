import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../../domain/entities/currency.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_event.dart';
import '../../bloc/auth/auth_state.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../../data/models/request/currency_request.dart';
import '../../../data/models/response/currency_response.dart';
import '../base_view.dart';
import 'package:http/http.dart' as http;


class CurrencyConvertView extends BaseView {
  @override
  State<CurrencyConvertView> createState() => _CurrencyConvertViewState();
}

class _CurrencyConvertViewState extends BaseViewState<CurrencyConvertView> {
  var bloc = injection<UserBloc>();

  List<String>? availableCurrencies; // List of extracted currency names
  String? selectedCurrency; // Currently selected currency
  Results? currenciesList;
  String? currencies;
  String? currencies2;
  var list;
  String? from;

  List<Currency> currenciesList2 = [];

  final Uri currencyURL = Uri.https("free.currconv.com","/api/v7/currencies",{"apiKey":"0ed140e5e1703d754564"});

  @override
  void initState() {
    super.initState();
    setState(() {
      bloc.add(CurrencyDataEvent(currencyRequest: CurrencyRequest(apiKey: '0ed140e5e1703d754564')));
    });
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fontColorWhite,
      body: BlocProvider<UserBloc>(
        create: (_) => bloc,
        child: BlocListener<UserBloc, BaseState<UserState>>(
          listener: (_, state) {
            if (state is CurrencyDataState) {
              setState(() {

                list = state.result;

                //list = body["results"];



              });
            }
          },
          child: Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // DropdownButton<String>(
                //   value: selectedCurrency,
                //   items: availableCurrencies
                //       .map((currency) => DropdownMenuItem(
                //     value: currency,
                //     child: Text(currency,),
                //   ))
                //       .toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       selectedCurrency = value;
                //     });
                //
                //   },
                //
                // ),


                Text(currencies ?? ""),
                //Text(myList2)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}