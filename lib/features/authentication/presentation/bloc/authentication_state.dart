part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  final String title;

  AuthenticationState(this.title);

  @override
  List<Object> get props => [title];
}

class AuthenticationStateInitial extends AuthenticationState {
  AuthenticationStateInitial({@required String title}) : super(title);

  @override
  List<Object> get props => [title];
}

class AuthenticationSuccess extends AuthenticationState {
  final String buttonTitle;
  final String inputPlaceHolder;
  final AuthenticationRouterAction routerAction;

  AuthenticationSuccess({
    @required String title,
    @required this.buttonTitle,
    @required this.inputPlaceHolder,
    this.routerAction,
  }) : super(title);

  AuthenticationState copyWith({
    AuthenticationRouterAction routerAction,
  }) {
    return AuthenticationSuccess(
      title: title,
      buttonTitle: buttonTitle,
      inputPlaceHolder: inputPlaceHolder,
      routerAction: routerAction ?? this.routerAction,
    );
  }

  @override
  List<Object> get props =>
      [title, buttonTitle, inputPlaceHolder, routerAction];
}
