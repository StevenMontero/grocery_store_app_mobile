import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lamanda_petshopcr/src/models/userProfile.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelState());

  void entryDateChanged(DateTime date) {
    emit(state.copyWith(entryDate: date));
  }

  void departureDateChanged(DateTime date) {
    emit(state.copyWith(departureDate: date));
  }

  void raceChanged(String race) {
    emit(state.copyWith(race: race));
  }

  void ageChanged(int age) {
    emit(state.copyWith(age: age));
  }

  void userDeliverChanged(UserProfile user) {
    emit(state.copyWith(userDeliver: user));
  }

  void userPickupChanged(String user) {
    emit(state.copyWith(userPickup: user));
  }

  void lastDewormingChanged(DateTime date) {
    emit(state.copyWith(lastDeworming: date));
  }

  void lastProtectionFleasChanged(DateTime date) {
    emit(state.copyWith(lastProtectionFleas: date));
  }

  void transporteChanged(bool transport) {
    emit(state.copyWith(
        transporte: transport, direccion: transport ? state.direccion : ''));
  }

  void direccionChanged(String direction) {
    emit(state.copyWith(direccion: direction));
  }

  void isVaccinationUpDateChanged(bool value) {
    emit(state.copyWith(isVaccinationUpDate: value));
  }

  void isCastratedDateChanged(bool value) {
    emit(state.copyWith(isCastrated: value));
  }

  void isSociableChanged(bool value) {
    emit(state.copyWith(isSociable: value));
  }
}
