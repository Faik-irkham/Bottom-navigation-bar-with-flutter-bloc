part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  final int pageIndex;
  const NavigationState(this.pageIndex);

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {
  const NavigationInitial() : super(0); // Halaman awal: Home
}

class HomeNavigationState extends NavigationState {
  const HomeNavigationState() : super(0);
}

class OverviewNavigationState extends NavigationState {
  const OverviewNavigationState() : super(1);
}

class AlertNavigationState extends NavigationState {
  const AlertNavigationState() : super(2);
}

class ProfileNavigationState extends NavigationState {
  const ProfileNavigationState() : super(3);
}
