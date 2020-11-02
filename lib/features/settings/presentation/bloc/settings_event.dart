part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {}

class SettingsEventStarted extends SettingsEvent {
  @override
  List<Object> get props => [];
}

class SettingsEventLogOut extends SettingsEvent {
  @override
  List<Object> get props => [];
}
