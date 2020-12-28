part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({

    this.userName,
    this.email,
    this.photoUrl,
    this.lastName,
    this.addres,
    this.phone,
    this.status
  });

  final String userName;
  final String email;
  final String photoUrl;
  final String lastName;
  final String addres; 
  final String phone;
  final FormzStatus status;
  
  ProfileState copyWith({
   String userName,
   String email,
   String photoUrl,
   String lastName,
   String addres,
   String phone,
  FormzStatus status,
  }) {
    return ProfileState(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl,
        lastName: lastName ?? this.lastName,
        addres: addres ?? this.addres,
        phone: phone ?? this.phone,
        status: status ?? this.status,
        );
  }

  @override
  List<Object> get props => [
        userName,
        email,
        photoUrl,
        lastName,
        addres,
        phone,
        status,  
      ];
}