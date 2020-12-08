import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:lamanda_petshopcr/src/models/sthetic_appointment.dart';
import 'package:lamanda_petshopcr/src/models/userProfile.dart';
import 'package:lamanda_petshopcr/src/repository/sthetic_appointment_repositorydb.dart';
//import 'package:lamanda_petshopcr/src/utils/regularExpressions/text_noempty.dart';

part 'grooming_state.dart';

class GroomingCubit extends Cubit<GroomingFormState> {
  GroomingCubit(this._appointmentRepository) : super(GroomingFormState());
  final StheticAppointmentRepository _appointmentRepository;
  StheticAppointment stheticAppointment;

  void dateInCalendarChanged(DateTime date) async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final list = await _appointmentRepository.getListAppointmetsFree(date);
      emit(state.copyWith(
          schedule: list,
          status: FormzStatus.submissionSuccess,
          hourRerservation: list[0]));
    } catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void hourChanged(DateTime date) async {
    emit(state.copyWith(hourRerservation: date));
  }

  void typeFurChanged(String fur) async {
    emit(state.copyWith(typeFur: fur));
  }

  void descriptionChanged(String des) async {
    emit(state.copyWith(description: des));
  }

  void transferChanged(bool transfer) async {
    emit(state.copyWith(
        transporte: transfer, direccion: transfer ? state.address : ''));
  }

  void direccionChanged(String dir) async {
    emit(state.copyWith(direccion: dir));
  }

  Future<void> addAppointmentGroomingForm (UserProfile user) async{
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
    try{
      stheticAppointment = new StheticAppointment(
        entrytDate: state.hourRerservation,
        client: user,
        isConfirmed: false,
        transfer: state.transfer,
        address: state.address,
        fur: state.typeFur
      );
      _appointmentRepository.addNewAppointment(stheticAppointment);

    }catch (error){
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
