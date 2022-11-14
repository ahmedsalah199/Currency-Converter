import 'package:currency_converter/core/utils/app_colors.dart';
import 'package:currency_converter/core/utils/app_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_font.dart';
import '../../core/utils/components.dart';
import '../cubit/cubit_app/app_cubit.dart';
import '../widgets/drop_down_button_widget.dart';

class HistoricalDataScreen extends StatelessWidget {
  const HistoricalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.getCubit(context);
        return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p18, vertical: AppPadding.p25),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s40))),
            child: Column(
              children: [
                DropSownButtonWidget(
                    currencies: cubit.testCurrencies,
                    selectedValue: cubit.selectedCurrency,
                    onChange: (value) async {
                      await cubit.changeValueSelectedCurrency(value!);
                      cubit.getExchangeCurrency();
                    }),
                Expanded(
                  child: ListWheelScrollView(
                      itemExtent: AppSize.s100,
                      diameterRatio: 1.5,
                      overAndUnderCenterOpacity: 0.8,
                      physics: const FixedExtentScrollPhysics(),
                      children:
                          List.generate(cubit.exchangeCurrency.length, (index) {
                        String key =
                            cubit.exchangeCurrency.keys.elementAt(index);
                        var values = cubit.exchangeCurrency.values
                            .elementAt(index)
                            .toStringAsFixed(2);
                        return Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(.4),
                              borderRadius: BorderRadius.circular(AppSize.s10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  createFlag(key),
                                  style: TextStyle(fontSize: AppFontSize.s40),
                                ),
                                Text(
                                  key,
                                  style: TextStyle(
                                      fontSize: AppFontSize.s20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  values,
                                  style: TextStyle(
                                      fontSize: AppFontSize.s20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ));
                      })),
                ),
              ],
            ));
      },
    );
  }
}
