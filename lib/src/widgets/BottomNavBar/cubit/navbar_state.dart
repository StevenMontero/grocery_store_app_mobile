part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final currenIndex;
  NavbarState.initialIndex({this.currenIndex = 0});
  NavbarState.indexChange({this.currenIndex});

  List<Object> get props => [currenIndex];
}
