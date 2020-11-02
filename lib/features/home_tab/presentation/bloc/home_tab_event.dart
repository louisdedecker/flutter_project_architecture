part of 'home_tab_bloc.dart';

@immutable
abstract class HomeTabEvent extends Equatable {}

class HomeTabEventStarted extends HomeTabEvent {
  @override
  List<Object> get props => [];
}

class HomeTabEventNextButton extends HomeTabEvent {
  @override
  List<Object> get props => [];
}
