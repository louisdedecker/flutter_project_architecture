import 'dart:async';

import 'package:architecture_template/common/repositories/authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../settings_router.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthenticationRepository authenticationRepository;
  var _settingsStateSuccess = SettingsStateSuccess(
    title: "Settings",
    buttonLogOutTitle: "log out",
  );

  SettingsBloc({@required this.authenticationRepository})
      : assert(authenticationRepository != null),
        super(SettingsStateInitial(title: "Settings"));

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is SettingsEventStarted) {
      yield _settingsStateSuccess;
    } else if (event is SettingsEventLogOut) {
      await authenticationRepository.logOut();
      yield _settingsStateSuccess;
    }
  }
}
