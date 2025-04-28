import 'package:flutter/material.dart';

abstract class ProfileEvent {}

class ShowDatePickerEditProfileEvent extends ProfileEvent {
  final BuildContext context;

  ShowDatePickerEditProfileEvent({
    required this.context,
  });
}

class GeneralNotificationEvent extends ProfileEvent {
  final bool generalNotificationSwitchVal;

  GeneralNotificationEvent({
    required this.generalNotificationSwitchVal,
  });
}

class SoundEvent extends ProfileEvent {
  final bool soundSwitchVal;

  SoundEvent({
    required this.soundSwitchVal,
  });
}

class SoundCallEvent extends ProfileEvent {
  final bool soundCallSwitchVal;

  SoundCallEvent({
    required this.soundCallSwitchVal,
  });
}

class VibrateEvent extends ProfileEvent {
  final bool vibrateSwitchVal;

  VibrateEvent({
    required this.vibrateSwitchVal,
  });
}

class SpecialOffersEvent extends ProfileEvent {
  final bool specialOffersSwitchVal;

  SpecialOffersEvent({
    required this.specialOffersSwitchVal,
  });
}

class PaymentsEvent extends ProfileEvent {
  final bool paymentsSwitchVal;

  PaymentsEvent({
    required this.paymentsSwitchVal,
  });
}

class PromoAndDiscountEvent extends ProfileEvent {
  final bool promoAndDiscountSwitchVal;

  PromoAndDiscountEvent({
    required this.promoAndDiscountSwitchVal,
  });
}

class CashbackEvent extends ProfileEvent {
  final bool cashbackSwitchVal;

  CashbackEvent({
    required this.cashbackSwitchVal,
  });
}

class ChangeHelpBodyIndexEvent extends ProfileEvent {
  final int index;

  ChangeHelpBodyIndexEvent({
    required this.index,
  });
}

class ChangePopularTopicIndexEvent extends ProfileEvent {
  final int index;

  ChangePopularTopicIndexEvent({
    required this.index,
  });
}

class CardNumberEvent extends ProfileEvent {
  final String number;

  CardNumberEvent({
    required this.number,
  });
}

class CardNameEvent extends ProfileEvent {
  final String name;

  CardNameEvent({
    required this.name,
  });
}

class ExpiryDateEvent extends ProfileEvent{
  final BuildContext context;

  ExpiryDateEvent({
    required this.context,
  });
}
