import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial()) {
    on<PageTapped>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
