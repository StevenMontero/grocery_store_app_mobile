import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarState.initialIndex());

  void indexChange(int index) {
    print(index);
    emit(NavbarState.indexChange(currenIndex: index));
  }
}
