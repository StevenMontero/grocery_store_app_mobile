part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.userName = const UserName.pure(),
    this.phone = const NumberPhone.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    
  });

  final UserName userName;
  final NumberPhone phone;
  final Email email;
  final Password password;
  final FormzStatus status;
  
  @override
  List<Object> get props => [userName, phone, email, password, status];

  SignUpState copyWith({
    UserName userName,
    NumberPhone phone,
    Email email,
    Password password,
    FormzStatus status,
  }) {
    return SignUpState(
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
