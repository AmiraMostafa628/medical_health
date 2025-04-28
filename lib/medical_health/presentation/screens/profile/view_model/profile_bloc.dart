import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/profile/view_model/profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  static ProfileBloc get(context) => BlocProvider.of(context);

  ProfileBloc() : super(ProfileStates()) {
    on<ShowDatePickerEditProfileEvent>(_showDatePicker);
    on<GeneralNotificationEvent>(_generalNotification);
    on<SoundEvent>(_sound);
    on<SoundCallEvent>(_soundCall);
    on<VibrateEvent>(_vibrate);
    on<SpecialOffersEvent>(_specialOffers);
    on<PaymentsEvent>(_payments);
    on<PromoAndDiscountEvent>(_promoAndDiscount);
    on<CashbackEvent>(_cashback);
    on<ChangeHelpBodyIndexEvent>(_changeHelpBodyIndex);
    on<ChangePopularTopicIndexEvent>(_changePopularTopicIndex);
    on<CardNumberEvent>(_changeCardNumber);
    on<CardNameEvent>(_changeCardName);
    on<ExpiryDateEvent>(_changeExpiryDate);
  }

  FutureOr<void> _showDatePicker(
    ShowDatePickerEditProfileEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    late String formattedDate = '';
    DateTime? pickedDate = await showDatePicker(
      context: event.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      formattedDate = DateFormat('dd/MM/yy').format(pickedDate);
    }
    emit(
      state.copyWith(
        date: formattedDate,
      ),
    );
  }

  FutureOr<void> _generalNotification(
    GeneralNotificationEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        notificationSwitchVal: event.generalNotificationSwitchVal,
      ),
    );
  }

  FutureOr<void> _sound(
    SoundEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        soundSwitchVal: event.soundSwitchVal,
      ),
    );
  }

  FutureOr<void> _soundCall(
    SoundCallEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        soundCallSwitchVal: event.soundCallSwitchVal,
      ),
    );
  }

  FutureOr<void> _vibrate(
    VibrateEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        vibrateSwitchVal: event.vibrateSwitchVal,
      ),
    );
  }

  FutureOr<void> _specialOffers(
    SpecialOffersEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(specialOffersSwitchVal: event.specialOffersSwitchVal),
    );
  }

  FutureOr<void> _payments(
    PaymentsEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        paymentsSwitchVal: event.paymentsSwitchVal,
      ),
    );
  }

  FutureOr<void> _promoAndDiscount(
    PromoAndDiscountEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        promoAndDiscountSwitchVal: event.promoAndDiscountSwitchVal,
      ),
    );
  }

  FutureOr<void> _cashback(
    CashbackEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        cashbackSwitchVal: event.cashbackSwitchVal,
      ),
    );
  }

  FutureOr<void> _changeHelpBodyIndex(
    ChangeHelpBodyIndexEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        selectedHelpBodyIndexIndex: event.index,
      ),
    );
  }

  FutureOr<void> _changePopularTopicIndex(
    ChangePopularTopicIndexEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        selectedPopularTopicIndexIndex: event.index,
      ),
    );
  }

  FutureOr<void> _changeCardNumber(
    CardNumberEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        cardNumber: event.number,
      ),
    );
  }

  FutureOr<void> _changeCardName(
    CardNameEvent event,
    Emitter<ProfileStates> emit,
  ) {
    emit(
      state.copyWith(
        cardName: event.name,
      ),
    );
  }

  Future<void> _changeExpiryDate(
    ExpiryDateEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    late String formattedDate = '';
    DateTime? pickedDate = await showDatePicker(
      context: event.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );
    if (pickedDate != null) {
      formattedDate = DateFormat('MM/dd').format(pickedDate);
    }
    emit(
      state.copyWith(
        expiryDate: formattedDate,
      ),
    );
  }
}
