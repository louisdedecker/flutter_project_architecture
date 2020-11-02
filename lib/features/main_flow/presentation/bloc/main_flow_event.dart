part of 'main_flow_bloc.dart';

@immutable
abstract class MainFlowEvent extends Equatable {}

class MainFlowEventStarted extends MainFlowEvent {
  @override
  List<Object> get props => [];
}

class MainFlowEventShowHome extends MainFlowEvent {
  @override
  List<Object> get props => [];
}

class MainFlowEventShowAuthentication extends MainFlowEvent {
  @override
  List<Object> get props => [];
}
