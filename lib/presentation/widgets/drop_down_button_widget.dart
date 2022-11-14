import 'package:currency_converter/core/utils/app_font.dart';
import 'package:currency_converter/core/utils/app_value.dart';
import 'package:flutter/material.dart';

class DropSownButtonWidget extends StatelessWidget {
  final List<String>? currencies;
  final String selectedValue;
  final Function(String? value)? onChange;
  const DropSownButtonWidget(
      {Key? key,
      required this.currencies,
      required this.selectedValue,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: DropdownButton(
        items: currencies!.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: AppFontSize.s20),
            ),
          );
        }).toList(),
        value: selectedValue,
        underline: Container(),
        icon: const Icon(
          Icons.arrow_drop_down,
        ),
        iconSize: AppSize.s35,
        iconEnabledColor: Colors.black,
        onChanged: onChange,
      ),
    );
  }
}
