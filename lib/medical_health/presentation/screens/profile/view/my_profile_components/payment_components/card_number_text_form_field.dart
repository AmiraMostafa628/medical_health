import 'package:flutter/material.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/color_manager.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/format_card_number.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_event.dart';

class CardNumberTextFormField extends StatelessWidget {
  CardNumberTextFormField({
    super.key,
    required this.cardNumber,
  });

  final cardNumberController = TextEditingController();
  late final Function(String) cardNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextFormField(
        controller: cardNumberController,
        keyboardType: TextInputType.number,
        validator: (String? value) {
          if (value == null && value == '') {
            return 'Card Number must not be empty ';
          }
          return null;
        },
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: ColorManager.textBlackColor, letterSpacing: 2),
        decoration: InputDecoration(
            hintText: '000 000 000 00',
            hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: ColorManager.hintTextColor,
                fontSize: 20,
                letterSpacing: 2),
            filled: true,
            fillColor: ColorManager.textFromFieldColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ))),
        inputFormatters: [FormatCardNumber()],
        onChanged: (value) {
          ProfileBloc.get(context).add(
            CardNumberEvent(number: value),
          );
          cardNumber(value);
        },
      ),
    );
  }
}
