import 'package:bloc/bloc.dart';
import 'package:currency_converter/app/injection.dart' as di;
import 'package:currency_converter/presentation/cubit/cubit_app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
