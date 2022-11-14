import 'package:currency_converter/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit_bottom_nav/cubit_bottom_nav.dart';
import '../cubit/cubit_bottom_nav/states_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitBottomNav, StateBottomNav>(
      builder: (context, state) {
        var cubit = CubitBottomNav.getCubit(context);
        return Scaffold(
          appBar: AppBar(title: const Text(AppStrings.appName)),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: cubit.bottomNavigationBarItem,
          ),
        );
      },
    );
  }
}
