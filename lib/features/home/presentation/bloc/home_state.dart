part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  final String title;

  HomeState({@required this.title});
}

class HomeStateInitial extends HomeState {
  HomeStateInitial({@required String title}) : super(title: title);

  @override
  List<Object> get props => [];
}

class HomeStateSuccess extends HomeState {
  final String title;
  final String apiPath;
  final String buttonTitle;
  final HomeRouterAction routerAction;

  HomeStateSuccess({
    @required this.title,
    @required this.apiPath,
    @required this.buttonTitle,
    this.routerAction,
  });

  HomeState copyWith({
    HomeRouterAction routerAction,
  }) {
    return HomeStateSuccess(
      title: title,
      apiPath: apiPath,
      buttonTitle: buttonTitle,
      routerAction: routerAction ?? this.routerAction,
    );
  }

  @override
  // set routerAction to DateTime.now() to be able to push the same routerAction time after time
  List<Object> get props =>
      [title, buttonTitle, routerAction != null ? DateTime.now() : null];
}
