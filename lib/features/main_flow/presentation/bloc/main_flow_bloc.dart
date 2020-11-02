import 'dart:async';

import 'package:architecture_template/common/repositories/authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'main_flow_event.dart';
part 'main_flow_state.dart';

class MainFlowBloc extends Bloc<MainFlowEvent, MainFlowState> {
  final AuthenticationRepository authenticationRepository;
  StreamSubscription _onAuthencatedStreamSubscription;

  MainFlowBloc({
    @required this.authenticationRepository,
  }) : super(MainFlowStateLoading()) {
    _onAuthencatedStreamSubscription =
        authenticationRepository.onAuthenticated.listen((authenticated) {
      if (authenticated == null) return;
      if (authenticated) {
        add(MainFlowEventShowHome());
      } else {
        add(MainFlowEventShowAuthentication());
      }
    });
  }

  @override
  Stream<MainFlowState> mapEventToState(
    MainFlowEvent event,
  ) async* {
    if (event is MainFlowEventStarted) {
      yield MainFlowStateLoading();
    } else if (event is MainFlowEventShowAuthentication) {
      yield MainFlowStateAuthentication();
    } else if (event is MainFlowEventShowHome) {
      yield MainFlowStateHome();
    }
  }

  @override
  Future<void> close() {
    _onAuthencatedStreamSubscription.cancel();
    return super.close();
  }
}
