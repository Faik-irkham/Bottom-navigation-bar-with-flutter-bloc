part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationHomeEvent extends NavigationEvent {}

class NavigationOverviewEvent extends NavigationEvent {}

class NavigationAlertEvent extends NavigationEvent {}

class NavigationProfileEvent extends NavigationEvent {}
