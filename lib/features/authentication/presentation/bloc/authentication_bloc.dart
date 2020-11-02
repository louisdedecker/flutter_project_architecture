import 'dart:async';

import 'package:architecture_template/common/repositories/authentication_repository/authentication_repository.dart';
import 'package:architecture_template/features/main_app/main_localizations.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../authentication_router.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final MainLocalizations localizations;
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({
    @required this.localizations,
    @required this.authenticationRepository,
  }) : super(
          AuthenticationStateInitial(
            title: localizations.localize("authentication"),
          ),
        );

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationEventStarted) {
      yield AuthenticationSuccess(
        title: localizations.localize("authentication"),
        buttonTitle: "continue",
        inputPlaceHolder: "input email",
      );
    } else if (event is AuthenticationEventContinueButton) {
      var result =
          await authenticationRepository.authenticate(email: event.value);
      if (result) {
        print("ok");
      }
    }
  }
}
