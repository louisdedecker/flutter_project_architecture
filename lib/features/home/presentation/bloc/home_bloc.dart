import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../home_router.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final String apiPath;

  HomeStateSuccess _homeStateSuccess;

  HomeBloc({
    @required this.apiPath,
  }) : super(HomeStateInitial(title: 'Home')) {
    _homeStateSuccess = HomeStateSuccess(
      title: "Home",
      apiPath: apiPath,
      buttonTitle: "details screen",
    );
  }

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeEventStarted) {
      yield _homeStateSuccess;
    } else if (event is HomeEventDetailButtonTapped) {
      yield _homeStateSuccess.copyWith(
        routerAction: HomeRouterAction.showDetailScreen,
      );
    }
  }
}
