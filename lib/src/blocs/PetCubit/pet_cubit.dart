import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:lamanda_petshopcr/src/models/pet.dart';
import 'package:lamanda_petshopcr/src/repository/pet_repositorydb.dart';

part 'pet_state.dart';

class PetCubit extends Cubit<PetState> {
  PetCubit(this.petRepository)
      : super(PetState());
  final PetRepository petRepository;
  Pet pet;

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void breedChanged(String breed) {
    emit(state.copyWith(breed: breed));
  }

  void ageChanged(int age) {
    emit(state.copyWith(age: age));
  }

  void furChanged(String fur) {
    emit(state.copyWith(fur: fur));
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

  void photoUrlChanged(String photpUrl) {
    emit(state.copyWith(photoUrl: photpUrl));
  }

  Future<void> addPetForm(String userID) async {
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
    try {
      pet = new Pet(
        userId: userID,
        name: state.name,
        breed: state.breed,
        age: state.age,
        fur: state.fur,
        isVaccinationUpDate: state.isVaccinationUpDate,
        castrated: state.isCastrated,
        sociable: state.isSociable,
      );
      petRepository.addNewPet(pet);
    } catch (error) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
