import 'package:equatable/equatable.dart';

class ProfileStates extends Equatable {
  final dynamic date;
  final bool notificationSwitchVal;
  final bool soundSwitchVal;
  final bool soundCallSwitchVal;
  final bool vibrateSwitchVal;
  final bool specialOffersSwitchVal;
  final bool paymentsSwitchVal;
  final bool promoAndDiscountSwitchVal;
  final bool cashbackSwitchVal;
  final int selectedHelpBodyIndexIndex;
  final int selectedPopularTopicIndexIndex;
  final String? cardNumber;
  final String cardName;
  final dynamic expiryDate;

  const ProfileStates({
    this.date,
    this.notificationSwitchVal = true,
    this.soundSwitchVal = true,
    this.soundCallSwitchVal = true,
    this.vibrateSwitchVal = false,
    this.specialOffersSwitchVal = false,
    this.paymentsSwitchVal = true,
    this.promoAndDiscountSwitchVal = false,
    this.cashbackSwitchVal = true,
    this.selectedHelpBodyIndexIndex = 0,
    this.selectedPopularTopicIndexIndex = -1,
    this.cardNumber,
    this.cardName = 'John Doe',
    this.expiryDate = '',
  });

  ProfileStates copyWith({
    dynamic date,
    bool? notificationSwitchVal,
    bool? soundSwitchVal,
    bool? soundCallSwitchVal,
    bool? vibrateSwitchVal,
    bool? specialOffersSwitchVal,
    bool? paymentsSwitchVal,
    bool? promoAndDiscountSwitchVal,
    bool? cashbackSwitchVal,
    int? selectedHelpBodyIndexIndex,
    int? selectedPopularTopicIndexIndex,
    String? cardNumber,
    String? cardName,
    String? expiryDate,
  }) {
    return ProfileStates(
      date: date ?? this.date,
      notificationSwitchVal:
          notificationSwitchVal ?? this.notificationSwitchVal,
      soundSwitchVal: soundSwitchVal ?? this.soundSwitchVal,
      soundCallSwitchVal: soundCallSwitchVal ?? this.soundCallSwitchVal,
      vibrateSwitchVal: vibrateSwitchVal ?? this.vibrateSwitchVal,
      specialOffersSwitchVal:
          specialOffersSwitchVal ?? this.specialOffersSwitchVal,
      paymentsSwitchVal: paymentsSwitchVal ?? this.paymentsSwitchVal,
      promoAndDiscountSwitchVal:
          promoAndDiscountSwitchVal ?? this.promoAndDiscountSwitchVal,
      cashbackSwitchVal: cashbackSwitchVal ?? this.cashbackSwitchVal,
      selectedHelpBodyIndexIndex:
          selectedHelpBodyIndexIndex ?? this.selectedHelpBodyIndexIndex,
      selectedPopularTopicIndexIndex:
          selectedPopularTopicIndexIndex ?? this.selectedPopularTopicIndexIndex,
      cardNumber: cardNumber ?? this.cardNumber,
      cardName: cardName ?? this.cardName,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  @override
  List<Object?> get props => [
        date,
        notificationSwitchVal,
        soundSwitchVal,
        soundCallSwitchVal,
        vibrateSwitchVal,
        specialOffersSwitchVal,
        paymentsSwitchVal,
        promoAndDiscountSwitchVal,
        cashbackSwitchVal,
        selectedHelpBodyIndexIndex,
        selectedPopularTopicIndexIndex,
        cardNumber,
        cardName,
        expiryDate
      ];
}
