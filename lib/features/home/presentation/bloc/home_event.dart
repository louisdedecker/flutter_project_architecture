part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeEventStarted extends HomeEvent {
  @override
  List<Object> get props => [];
}

class HomeEventDetailButtonTapped extends HomeEvent {
  @override
  List<Object> get props => [];
}
