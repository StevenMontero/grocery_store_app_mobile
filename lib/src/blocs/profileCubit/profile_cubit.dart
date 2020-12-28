import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:lamanda_petshopcr/src/models/userProfile.dart';
import 'package:lamanda_petshopcr/src/repository/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userRepository)
      : super(ProfileState());
  final UserRepository userRepository;
  UserProfile userProfile;

  void userNameChanged(String username) {
    emit(state.copyWith(userName: username));
  }

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void photoUrlChanged(String photoUrl) {
    emit(state.copyWith(photoUrl: photoUrl));
  }

  void lastNameChanged(String lastName) {
    emit(state.copyWith(lastName: lastName));
  }

  void addresChanged(String addres) {
    emit(state.copyWith(addres: addres));
  }

  void phoneChanged(String phone) {
    emit(state.copyWith(phone: phone));
  }

  Future<void> editUserForm(String userID) async {
    emit(state.copyWith(status: FormzStatus.submissionSuccess));
    try {
      userProfile = new UserProfile(
        id: userID,
        userName: state.userName,
        email: state.email,
        photoUri: state.photoUrl,
        lastName: state.lastName,
        address: state.addres,
        phone: state.phone,
      );
      userRepository.updateUser(userProfile);
    } catch (error) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}