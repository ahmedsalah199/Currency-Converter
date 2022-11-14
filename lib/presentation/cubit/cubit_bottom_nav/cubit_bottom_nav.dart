import 'package:currency_converter/presentation/cubit/cubit_bottom_nav/states_bottom_nav.dart';
import 'package:currency_converter/presentation/screens/converter_screen.dart';
import 'package:currency_converter/presentation/screens/currencies_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitBottomNav extends Cubit<StateBottomNav> {
  CubitBottomNav() : super(InitialBottomNav());
  static CubitBottomNav getCubit(context) => BlocProvider.of(context);
  List<Widget> screens = [
    CurrencyConverterScreen(),
    const HistoricalDataScreen(),
  ];

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItem = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.change_circle_outlined), label: "Converter"),
    BottomNavigationBarItem(
        icon: Icon(Icons.currency_exchange), label: 'Currencies'),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
