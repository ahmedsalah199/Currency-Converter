part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class CurrencySuccessState extends AppState {}

class CurrencyErrorState extends AppState {}

class ConvertCurrencySuccessState extends AppState {}

class ConvertCurrencyErrorState extends AppState {}

class ChangeCurrencyFromValueState extends AppState {}

class ChangeCurrencyToValueState extends AppState {}

class ChangeValueSelectedCurrencyState extends AppState {}
