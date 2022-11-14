import 'package:currency_converter/core/utils/app_colors.dart';
import 'package:currency_converter/core/utils/app_value.dart';
import 'package:currency_converter/core/utils/components.dart';
import 'package:currency_converter/presentation/widgets/drop_down_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_font.dart';
import '../../core/utils/app_strings.dart';
import '../cubit/cubit_app/app_cubit.dart';

class CurrencyConverterScreen extends StatelessWidget {
  final _keyForm = GlobalKey<FormState>();

  CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.getCubit(context);
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s40))),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p40, vertical: AppPadding.p40),
              child: Form(
                key: _keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropSownButtonWidget(
                        currencies: cubit.testCurrencies,
                        selectedValue: cubit.convertFromValue,
                        onChange: (value) {
                          cubit.changeConvertFromValue(value!);
                        }),
                    SizedBox(
                      height: AppSize.s15,
                    ),
                    defaultTextFormField(
                        controller: cubit.amountFromControl,
                        prefixIcon: Icons.attach_money_outlined,
                        keyboardType: TextInputType.number,
                        label: AppStrings.amount,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.enterTheAmount;
                          }
                          return null;
                        }),
                    SizedBox(
                      height: AppSize.s15,
                    ),
                    DropSownButtonWidget(
                        currencies: cubit.testCurrencies,
                        selectedValue: cubit.convertToValue,
                        onChange: (value) {
                          cubit.changeConvertToValue(value!);
                        }),
                    SizedBox(
                      height: AppSize.s15,
                    ),
                    buildExchangeButton(() {
                      cubit.convertCurrency(
                          amount: int.parse(cubit.amountFromControl.text));
                      FocusScope.of(context).unfocus();
                    }),
                    SizedBox(
                      height: AppSize.s15,
                    ),
                    defaultTextFormField(
                        controller: cubit.amountToControl,
                        prefixIcon: Icons.attach_money_outlined,
                        keyboardType: TextInputType.number,
                        label: AppStrings.amount,
                        readOnly: true,
                        filledColors: true,
                        validator: null),
                    SizedBox(
                      height: AppSize.s15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector buildExchangeButton(VoidCallback function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: AppColors.primaryColor.withOpacity(.9),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.change_circle_outlined,
              size: AppSize.s45,
              color: Colors.white,
            ),
            SizedBox(
              width: AppSize.s10,
            ),
            Text(
              AppStrings.exchange,
              style: TextStyle(
                fontSize: AppFontSize.s19,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
