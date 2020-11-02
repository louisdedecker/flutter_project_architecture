part of 'settings_bloc.dart';

@immutable
abstract class SettingsState extends Equatable {
  final String title;

  SettingsState({this.title});

  @override
  List<Object> get props => [];
}

class SettingsStateInitial extends SettingsState {
  final String title;

  SettingsStateInitial({this.title});

  @override
  List<Object> get props => [];
}

class SettingsStateSuccess extends SettingsState {
  final String title;
  final String buttonLogOutTitle;
  final SettingsRouterAction routerAction;

  SettingsStateSuccess({
    @required this.title,
    @required this.buttonLogOutTitle,
    this.routerAction,
  });

  SettingsState copyWith({
    SettingsRouterAction routerAction,
  }) {
    return SettingsStateSuccess(
      title: title,
      buttonLogOutTitle: buttonLogOutTitle,
      routerAction: routerAction ?? this.routerAction,
    );
  }

  @override
  List<Object> get props => [title, buttonLogOutTitle, routerAction];
}
