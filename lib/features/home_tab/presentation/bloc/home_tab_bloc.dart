import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../home_tab_router.dart';

part 'home_tab_event.dart';
part 'home_tab_state.dart';

class HomeTabBloc
    extends Bloc<HomeTabEvent, HomeTabState> {
  HomeTabBloc() : super(HomeTabStateInitial());

  @override
  Stream<HomeTabState> mapEventToState(
    HomeTabEvent event,
  ) async* {
    if (event is HomeTabEventStarted) {
      yield HomeTabStateSuccess(
        title: "HomeTab",
        buttonTitle: "next screen",
      );
    } else if (event is HomeTabEventNextButton) {
      yield HomeTabStateSuccess(
        title: "HomeTab",
        buttonTitle: "next screen",
        routerAction: HomeTabRouterAction.nextScreen,
      );
    }
  }
}
