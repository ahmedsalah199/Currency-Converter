import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../../data/repository.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  Repository repository;

  AppCubit({required this.repository}) : super(AppInitial());

  static AppCubit getCubit(context) => BlocProvider.of(context);

  List<String> testCurrencies = [
    "USD",
    "EGP",
    "NZD",
    "KWD",
    "BHD",
    "OMR",
    "JOD",
    "GBP",
    "EUR",
    "LYD",
    "SAR"
  ];
  String convertFromValue = AppStrings.usdCurrency;
  String convertToValue = AppStrings.egpCurrency;
  String selectedCurrency = AppStrings.usdCurrency;

  TextEditingController amountFromControl = TextEditingController();
  TextEditingController amountToControl = TextEditingController();

  changeConvertFromValue(String value) {
    convertFromValue = value;
    emit(ChangeCurrencyFromValueState());
  }

  changeConvertToValue(String value) {
    convertToValue = value;
    emit(ChangeCurrencyToValueState());
  }

  changeValueSelectedCurrency(String value) {
    selectedCurrency = value;
    emit(ChangeValueSelectedCurrencyState());
  }

  convertCurrency({required int amount}) async {
    await repository.getConvertCurrency(path: "latest", query: {
      "base": convertFromValue,
      "symbols": convertToValue,
    }).then((value) {
      value.forEach((k, v) {
        amountToControl.text = (v * amount).toStringAsFixed(2);
      });
      emit(ConvertCurrencySuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(ConvertCurrencyErrorState());
    });
  }

  Map<String, dynamic> exchangeCurrency = {};
  getExchangeCurrency() async {
    await repository.getConvertCurrency(path: "latest", query: {
      "base": selectedCurrency,
      "symbols": testCurrencies.join(','),
    }).then((value) {
      exchangeCurrency.addAll(value);
      emit(ConvertCurrencySuccessState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(ConvertCurrencyErrorState());
    });
  }
}
