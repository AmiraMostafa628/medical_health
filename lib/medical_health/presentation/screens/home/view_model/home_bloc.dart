import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_health_clean_arch/core/shared_function/week_date.dart';
import 'package:medical_health_clean_arch/medical_health/data/models/doctor_model.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/add_fav_doctors_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/delete_fav_doctors_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/fetch_doctors_data_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/domain/use_cases/fetch_doctors_use_cases/get_favorites_use_case.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/resources/app_constance.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_event.dart';
import 'package:medical_health_clean_arch/medical_health/presentation/screens/home/view_model/home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeStates> {
  static HomeBloc get(context) => BlocProvider.of(context);

  final FetchDoctorsDataUseCase fetchDoctorsDataUseCase;
  final FilterDoctorsUseCase filterDoctorsUseCase;
  final FetchFavDoctorsDataUseCase fetchFavDoctorsDataUseCase;
  final AddFavDoctorsDataUseCase addFavDoctorsDataUseCase;
  final DeleteFavDoctorsDataUseCase deleteFavDoctorsDataUseCase;

  HomeBloc(
    this.fetchDoctorsDataUseCase,
    this.filterDoctorsUseCase,
    this.fetchFavDoctorsDataUseCase,
    this.addFavDoctorsDataUseCase,
    this.deleteFavDoctorsDataUseCase,
  ) : super(HomeStates()) {
    on<HomeFetchDataEvent>(_homeInitialOrders);
    on<SelectedDayEvent>(_selectedDay);
    on<ChangeBottomNavEvent>(_changeBottomNav);
    on<ChangeIconEvent>(_changeIcon);
    on<AddFavoriteEvent>(_addFavorite);
    on<GetFavoriteEvent>(getFavorite);
    on<DeleteFromFavoriteEvent>(deleteFavorite);
    on<ChangeFavoriteButtonEvent>(_changeFavouriteButton);
    on<ChangeMedicalSpecializationEvent>(_changeMedicalSpecialization);
    on<SelectedDoctorInfoEvent>(_selectDoctorInfo);
  }

  FutureOr<void> _homeInitialOrders(
    HomeFetchDataEvent event,
    Emitter<HomeStates> emit,
  ) async {
    emit(state.copyWith(status: StatusType.loadingHome));
    final result = await fetchDoctorsDataUseCase.execute(null);

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (doctors) {
      emit(state.copyWith(
        maleDoctorsList:filterDoctorsUseCase.filterByGender(doctors, "male"),
        femaleDoctorsList:
            filterDoctorsUseCase.filterByGender(doctors, "female"),
        ratingDoctorsList: filterDoctorsUseCase.sortByRating(doctors),
        status: StatusType.success,
      ));
    });
  }

  FutureOr<void> _selectedDay(
    SelectedDayEvent event,
    Emitter<HomeStates> emit,
  ) {
    emit(
      state.copyWith(
        datesAndDays: getDatesAndDaysOfWeek(),
        selectedWeekIndex: event.index,
      ),
    );
  }

  FutureOr<void> _changeBottomNav(
    ChangeBottomNavEvent event,
    Emitter<HomeStates> emit,
  ) {
    emit(
      state.copyWith(selectedBottomNavbarIndex: event.index),
    );
  }

  FutureOr<void> _changeIcon(
    ChangeIconEvent event,
    Emitter<HomeStates> emit,
  ) {
    emit(
      state.copyWith(selectedIconIndex: event.index),
    );
  }

  FutureOr<void> _selectDoctorInfo(
    SelectedDoctorInfoEvent event,
    Emitter<HomeStates> emit,
  ) {
    emit(
      state.copyWith(
        doctorInfo: event.doctorModel,
      ),
    );
  }

  FutureOr<void> _changeFavouriteButton(
    ChangeFavoriteButtonEvent event,
    Emitter<HomeStates> emit,
  ) {
    emit(
      state.copyWith(
        selectedFavoriteButtonIndex: event.index,
      ),
    );
  }

  FutureOr<void> _changeMedicalSpecialization(
    ChangeMedicalSpecializationEvent event,
    Emitter<HomeStates> emit,
  ) {
    emit(
      state.copyWith(
        selectMedicalSpecializationIndex: event.index,
      ),
    );
  }

  FutureOr<void> _addFavorite(
    AddFavoriteEvent event,
    Emitter<HomeStates> emit,
  ) async {
    final model = DoctorModel(
        docName: event.doctorModel.docName,
        docProfile: event.doctorModel.docProfile,
        medicalSpecialization: event.doctorModel.medicalSpecialization,
        docRate: event.doctorModel.docRate,
        gender: event.doctorModel.gender,
        chatNum: event.doctorModel.chatNum,
        docId: event.doctorModel.docId);
    final result = await addFavDoctorsDataUseCase.execute(
      model,
    );

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (success) {
      emit(state.copyWith(
        favoriteDoctors: [...?state.favoriteDoctors, event.doctorModel], //merge 2 lists with the spread operator (...)
        status: StatusType.success,
      ));
    });
  }

  FutureOr<void> getFavorite(
    GetFavoriteEvent event,
    Emitter<HomeStates> emit,
  ) async {
    final result = await fetchFavDoctorsDataUseCase.execute(null);

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (doctors) {
      emit(state.copyWith(
        favoriteDoctors: doctors,
        status: StatusType.success,
      ));
    });
  }

  FutureOr<void> deleteFavorite(
    DeleteFromFavoriteEvent event,
    Emitter<HomeStates> emit,
  ) async {
    final model = DoctorModel(
        docName: event.doctorModel.docName,
        docProfile: event.doctorModel.docProfile,
        medicalSpecialization: event.doctorModel.medicalSpecialization,
        docRate: event.doctorModel.docRate,
        gender: event.doctorModel.gender,
        chatNum: event.doctorModel.chatNum,
        docId: event.doctorModel.docId);
    final result = await deleteFavDoctorsDataUseCase.execute(
      model,
    );

    result.fold((failure) {
      emit(
        state.copyWith(
          status: StatusType.failure,
          errorMessage: failure.message,
        ),
      );
    }, (success) {
      emit(state.copyWith(
        favoriteDoctors: state.favoriteDoctors
          ?.where((doctor) => doctor.docId != event.doctorModel.docId)
          .toList(),
        status: StatusType.success,
      ));
    });
  }
}
