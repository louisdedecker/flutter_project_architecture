part of 'home_tab_bloc.dart';

@immutable
abstract class HomeTabState extends Equatable {}

class HomeTabStateInitial extends HomeTabState {
  @override
  List<Object> get props => [];
}

class HomeTabStateSuccess extends HomeTabState {
  final String title;
  final String buttonTitle;
  final HomeTabRouterAction routerAction;

  HomeTabStateSuccess({
    @required this.title,
    @required this.buttonTitle,
    this.routerAction,
  });

  HomeTabState copyWith({
    HomeTabRouterAction routerAction,
  }) {
    return HomeTabStateSuccess(
      title: title,
      buttonTitle: buttonTitle,
      routerAction: routerAction ?? this.routerAction,
    );
  }

  @override
  List<Object> get props => [title, buttonTitle, routerAction];
}
