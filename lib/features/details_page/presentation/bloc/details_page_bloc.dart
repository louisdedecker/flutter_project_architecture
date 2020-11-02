import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../details_page_router.dart';

part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc
    extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc() : super(DetailsPageStateInitial());

  @override
  Stream<DetailsPageState> mapEventToState(
    DetailsPageEvent event,
  ) async* {
    if (event is DetailsPageEventStarted) {
      yield DetailsPageStateSuccess(
        title: "DetailsPage",
        buttonTitle: "next screen",
      );
    } else if (event is DetailsPageEventNextButton) {
      yield DetailsPageStateSuccess(
        title: "DetailsPage",
        buttonTitle: "next screen",
        routerAction: DetailsPageRouterAction.nextScreen,
      );
    }
  }
}
