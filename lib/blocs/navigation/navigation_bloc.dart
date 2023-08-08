// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationInitial()) {
    on<NavigationEvent>((event, emit) {
      if (event is NavigationHomeEvent) {
        emit(const HomeNavigationState());
      } else if (event is NavigationOverviewEvent) {
        emit(const OverviewNavigationState());
      } else if (event is NavigationAlertEvent) {
        emit(const AlertNavigationState());
      } else if (event is NavigationProfileEvent) {
        emit(const ProfileNavigationState());
      }
    });
  }
}
