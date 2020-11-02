part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {}

class AuthenticationEventStarted extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventContinueButton extends AuthenticationEvent {
  final String value;

  AuthenticationEventContinueButton({this.value});
  @override
  List<Object> get props => [value];
}
