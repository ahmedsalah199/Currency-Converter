import 'package:currency_converter/app/injection.dart' as di;
import 'package:currency_converter/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme_app.dart';
import '../core/utils/app_strings.dart';
import '../presentation/cubit/cubit_app/app_cubit.dart';
import '../presentation/cubit/cubit_bottom_nav/cubit_bottom_nav.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.instance<AppCubit>()..getExchangeCurrency(),
        ),
        BlocProvider(
          create: (context) => CubitBottomNav(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
