import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medical_health_clean_arch/core/services/go_router.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view/my_profile_components/payment_components/card_number_text_form_field.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_bloc.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_states.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_button.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/shared_widgets/custom_text_form_field.dart';

class CardInfo extends StatelessWidget {
  CardInfo({super.key});

  final cardNameController = TextEditingController();
  final expireDateController = TextEditingController();
  final cvvCardController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late String number = '';
    return Form(
      key: formKey,
      child: Column(
        spacing: 10.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Card Holder Name',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          CustomTextFormField(
            text: 'John Doe',
            fontSize: 20,
            textEditingController: cardNameController,
            onChange: (value) {
              ProfileBloc.get(context).add(
                CardNameEvent(name: value),
              );
            },
            validate: (value) {
              if (value.isEmpty) {
                return 'Card Holder Name can\'t be empty ';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Card Number',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
          CardNumberTextFormField(
            cardNumber: (value) {
              number = value;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Expiry Date',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    BlocBuilder<ProfileBloc, ProfileStates>(
                        builder: (context, state) {
                      expireDateController.text = state.expiryDate;
                      return CustomTextFormField(
                        text: 'mm/dd',
                        spacing: 2,
                        fontSize: 16,
                        type: TextInputType.datetime,
                        readOnly: true,
                        onTap: () {
                          ProfileBloc.get(context).add(
                            ExpiryDateEvent(context: context),
                          );
                        },
                        textEditingController: expireDateController,
                        onChange: (value) {},
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Expiry Date can\'t be empty ';
                          }
                          return null;
                        },
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'cvv'.toUpperCase(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomTextFormField(
                      text: '000',
                      spacing: 2,
                      fontSize: 16,
                      type: TextInputType.number,
                      textEditingController: cvvCardController,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'CVV can\'t be empty ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextButton(
            text: 'Save Card',
            onPressed: () {
              if (number.isNotEmpty && formKey.currentState!.validate()) {
                GoRouter.of(context).push(AppRouter.kFinishPaymentMethod);
              }
            },
            height: 50,
            borderRadius: BorderRadius.circular(30.0),
            upperCase: false,
          )
        ],
      ),
    );
  }
}
